# -*- coding: utf-8 -*-
import KBEngine
import hashlib
import random
import re
from datetime import datetime, timedelta
import json
import time

import AsyncRequest
import const
import switch
from KBEDebug import *
import x42

MELD_HISTORY = {}


def meld_with_pair_need_num(tiles, history=MELD_HISTORY):
	"""
	这个函数是赖子牌判断中最底层的函数, 尽量保证把万条筒中发白等分类出来(即保证清一色), 在扔到这里计算, 能够大幅提高效率
	:param tiles: 某个类型的牌, 比如清一色的万
	:param history: cache
	:return: 构成带将整扑所需要的赖子个数
	"""
	case1 = case2 = 999
	if meld_only_need_num(tiles, history) == 0:
		case1 = 2

	for i in tiles:
		tmp = list(tiles)
		if tiles.count(i) == 1:
			tmp.remove(i)
			case2 = min(case2, 1 + meld_only_need_num(tmp, history))
		else:
			tmp.remove(i)
			tmp.remove(i)
			case2 = min(case2, meld_only_need_num(tmp, history))

	return min(case1, case2)


def meld_only_need_num(tiles, history=MELD_HISTORY, used=0):
	"""
	这个函数是赖子牌判断中最底层的函数, 尽量保证把万条筒中发白等分类出来(即保证清一色), 在扔到这里计算, 能够大幅提高效率
	:param tiles: 某个类型的牌, 比如清一色的万
	:param history: cache
	:used: 已经使用的赖子个数
	:return: 构成带将整扑所需要的赖子个数
	"""
	if used > 4:
		return 999
	tiles = sorted(tiles)
	key = tuple(tiles)
	if key in history.keys():
		return history[key]

	size = len(tiles)
	if size == 0:
		return 0
	if size == 1:
		return 2
	if size == 2:
		p1, p2 = tiles[:2]
		case1 = 999
		if p1 < const.BOUNDARY and p2 - p1 <= 2:
			case1 = 1
		case2 = 0
		if p1 == p2:
			case2 = 1
		else:
			case2 = 4
		return min(case1, case2)

	first = tiles[0]
	# 自己组成顺子
	left1 = list(tiles[1:])
	case1 = 0
	if first >= const.BOUNDARY:
		case1 = 999
	else:
		if first + 1 in left1:
			left1.remove(first + 1)
		else:
			case1 += 1
		if first + 2 in left1:
			left1.remove(first + 2)
		else:
			case1 += 1
		res1 = meld_only_need_num(left1, history)
		history[tuple(left1)] = res1
		case1 += res1

	# 自己组成刻子
	left2 = list(tiles[1:])
	case2 = 0
	count = left2.count(first)
	if count >= 2:
		left2.remove(first)
		left2.remove(first)
	elif count == 1:
		left2.remove(first)
		case2 += 1
	else:
		case2 += 2
	res2 = meld_only_need_num(left2, history)
	history[tuple(left2)] = res2
	case2 += res2
	result = min(case1, case2)
	history[tuple(tiles)] = result
	return result


def getMeldNeed(handTiles):
	"""
	得到手牌中不含赖子牌之外的其他牌要凑成整扑(3*X)需要的赖子牌数
	:param handTiles: 手牌
	:return:
	"""
	tileList = classifyTiles(handTiles)
	tileList.pop(0)
	return sum(meld_only_need_num(t) for t in tileList)


def is_same_day(ts1, ts2):
	d1 = datetime.fromtimestamp(ts1)
	d2 = datetime.fromtimestamp(ts2)

	if (d1.year, d1.month, d1.day) == (d2.year, d2.month, d2.day):
		return True
	return False


def gen_uid(count):
	id_s = str(count)
	size = len(id_s)
	ran_num = pow(10, max(6 - size, 0))
	ran_fix = str(random.randint(ran_num, 10 * ran_num - 1))
	return int(ran_fix + id_s)

def gen_club_id(count):
	id_s = str(count)
	size = len(id_s)
	if size < 5:
		for i in range(1000):
			ran_num = pow(10, max(4 - size, 0))
			ran_fix = str(random.randint(ran_num, 10 * ran_num - 1))
			cid = int(ran_fix + id_s)
			if cid not in x42.ClubStub.clubs:
				return cid
	else:
		return count

def gen_room_id():
	if switch.DEBUG_BASE == 1:
		return 99999
	randomId = random.randint(10000, 99999)
	for i in range(89999):
		val = randomId + i
		if val > 99999:
			val = val%100000 + 10000
		if val not in KBEngine.globalData["GameWorld"].rooms:
			return val
	return 99999


def filter_emoji(nickname):
	try:
		# UCS-4
		highpoints = re.compile(u'[\U00010000-\U0010ffff]')
	except re.error:
		# UCS-2
		highpoints = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
	nickname = highpoints.sub(u'', nickname)
	return nickname


def classifyTiles(tiles, kingTiles=None):
	kingTiles = kingTiles or []
	kings = []
	chars = []
	bambs = []
	dots = []
	winds = []
	dragons = []

	tiles = sorted(tiles)
	for t in tiles:
		if t in kingTiles:
			kings.append(t)
		elif t in const.CHARACTER:
			chars.append(t)
		elif t in const.BAMBOO:
			bambs.append(t)
		elif t in const.DOT:
			dots.append(t)
		elif t in const.WINDS:
			winds.append(t)
		elif t in const.DRAGONS:
			dragons.append(t)
	return [kings, chars, bambs, dots, winds, dragons]


def classifyWindTiles(tiles, kingTiles):
	kings = []
	handTiles = []

	tiles = sorted(tiles)
	for t in tiles:
		if t in kingTiles:
			kings.append(t)
		elif t in const.CHARACTER:
			handTiles.append(t)
		elif t in const.BAMBOO:
			handTiles.append(t)
		elif t in const.DOT:
			handTiles.append(t)
		elif t in const.WINDS:
			handTiles.append(t)
		elif t in const.DRAGONS:
			handTiles.append(t)
	return [kings, handTiles]


def classifyTiles4Type(tiles):
	chars = []
	bambs = []
	dots = []
	winds_dragons = []
	tiles = sorted(tiles)
	for t in tiles:
		if t in const.CHARACTER:
			chars.append(t)
		elif t in const.BAMBOO:
			bambs.append(t)
		elif t in const.DOT:
			dots.append(t)
		elif t in const.WINDS or t in const.DRAGONS:
			winds_dragons.append(t)
	return [chars, bambs, dots, winds_dragons]


def getTile2NumDict(tiles):
	tile2NumDict = {}
	for t in tiles:
		tile2NumDict[t] = tile2NumDict.get(t, 0) + 1
	return tile2NumDict


def getPairNum(tiles, isContainTriple=False, isContainKong=False):
	num = 0
	tile2NumDict = getTile2NumDict(tiles)
	for tile in tile2NumDict:
		if tile2NumDict[tile] == 2:
			num += 1
		elif tile2NumDict[tile] == 3 and isContainTriple:
			num += 1
		elif tile2NumDict[tile] == 4 and isContainKong:
			num += 2
	return num


def getKongNum(tiles):
	num = 0
	tile2NumDict = getTile2NumDict(tiles)
	for tile in tile2NumDict:
		if tile2NumDict[tile] == 4:
			num += 1
	return num


def getTileNum(tiles, aimTile):
	num = 0
	tile2NumDict = getTile2NumDict(tiles)
	if aimTile in tile2NumDict:
		num = tile2NumDict[aimTile]
	return num

def get_md5(data):
	m = hashlib.md5()
	m.update(data.encode())
	return m.hexdigest()

# 发送网络请求
def get_user_info(accountName, callback):
	ts = int(time.mktime(datetime.now().timetuple()))
	tosign = accountName + "_" + str(ts) + "_" + switch.PHP_SERVER_SECRET
	m1 = hashlib.md5()
	m1.update(tosign.encode())
	sign = m1.hexdigest()
	url = switch.PHP_SERVER_URL + 'user_info_server'
	suffix = '?timestamp=' + str(ts) + '&unionid=' + accountName + '&sign=' + sign
	AsyncRequest.Request(url + suffix, lambda x: callback(x))

def get_is_proxy(accountName, callback):
	ts = get_cur_timestamp()
	to_sign = accountName + "_" + str(ts) + "_" + switch.PHP_SERVER_SECRET
	sign = get_md5(to_sign)
	url = switch.PHP_SERVER_URL + 'is_proxy'
	suffix = '?timestamp=' + str(ts) + '&unionid=' + accountName + '&sign=' + sign
	AsyncRequest.Request(url + suffix, lambda x: callback(x))


def update_card_diamond(accountName, deltaCard, deltaDiamond, callback, reason = ""):
	ts = get_cur_timestamp()
	to_sign = accountName + "_" + str(ts) + "_" + str(deltaCard) + "_" + str(deltaDiamond) + "_" + switch.PHP_SERVER_SECRET
	# DEBUG_MSG("to sign::" + to_sign)
	sign = get_md5(to_sign)
	# DEBUG_MSG("MD5::" + sign)
	url = switch.PHP_SERVER_URL + 'update_card_diamond'
	data = {
		"timestamp" : ts,
		"delta_card" : deltaCard,
		"delta_diamond" : deltaDiamond,
		"unionid" : accountName,
		"sign" : sign,
		"reason" : reason
	}
	AsyncRequest.Post(url, data, lambda x: callback(x))

def update_card_diamond_aa(accountList, deltaCard, deltaDiamond, callback, reason=""):
	ts = get_cur_timestamp()
	account_json = json.dumps(accountList)
	to_sign = account_json + "_" + str(ts) + "_" + str(deltaCard) + "_" + str(deltaDiamond) + "_" + switch.PHP_SERVER_SECRET
	# DEBUG_MSG("to sign::" + to_sign)
	sign = get_md5(to_sign)
	# DEBUG_MSG("aa MD5::" + sign)
	url = switch.PHP_SERVER_URL + 'update_card_diamond_aa'
	data = {
		"timestamp": ts,
		"delta_card": deltaCard,
		"delta_diamond": deltaDiamond,
		"unionids": account_json,
		"sign": sign,
		"reason": reason
	}
	AsyncRequest.Post(url, data, lambda x: callback(x))


def update_valid_account(accountName, callback):
	to_sign = accountName + "_" + switch.PHP_SERVER_SECRET
	# DEBUG_MSG("to sign::" + to_sign)
	sign = get_md5(to_sign)
	# DEBUG_MSG("valid MD5::" + sign)
	url = switch.PHP_SERVER_URL + 'update_valid'
	data = {
		"unionid": accountName,
		"sign": sign,
	}
	AsyncRequest.Post(url, data, lambda x: callback(x))

def update_data_statistics(ts, avatar_num, online_num, room_num, callback):
	to_sign = const.GAME_NAME + "_" + str(ts) + "_" + str(avatar_num) + "_" + str(online_num) + "_" + str(room_num) + "_"  + switch.PHP_SERVER_SECRET
	# INFO_MSG("stats to sign::" + to_sign)
	sign = get_md5(to_sign)
	# INFO_MSG("stats MD5::" + sign)
	url = switch.PHP_SERVER_URL + 'update_data_statistics'
	data = {
		"game_name": const.GAME_NAME,
		"timestamp": ts,
		"avatar_num": avatar_num,
		"online_num": online_num,
		"room_num": room_num,
		"sign": sign,
	}
	AsyncRequest.Post(url, data, lambda x: callback(x))

def update_dau(dau, callback):
	ts = get_cur_timestamp()
	to_sign = const.GAME_NAME + "_" + str(ts) + "_" + str(dau) + "_" + switch.PHP_SERVER_SECRET
	INFO_MSG("dau to sign::" + to_sign)
	sign = get_md5(to_sign)
	INFO_MSG("dau MD5::" + sign)
	url = switch.PHP_SERVER_URL + 'update_dau'
	data = {
		"game_name": const.GAME_NAME,
		"timestamp": ts,
		"num": dau,
		"sign": sign,
	}
	AsyncRequest.Post(url, data, lambda x: callback(x))


# 获取测试模式 初始信息
def getDebugPrefab(owner, callback):
	ts = int(time.mktime(datetime.now().timetuple()))
	url = '{}?timestamp={}&from=py&game={}&owner={}'.format(switch.PHP_DEBUG_URL, ts, const.DEBUG_JSON_NAME, owner)
	AsyncRequest.Request(url, lambda x: callback(x))


def validTile(t):
	return any(t in tiles for tiles in const.VALID_TILES)


def getTileColorType(handTilesButKing, uptiles):
	suitNumList = [0, 0, 0]
	honorNum = 0
	for t in handTilesButKing:
		if t in const.CHARACTER:
			suitNumList[0] = 1
		elif t in const.BAMBOO:
			suitNumList[1] = 1
		elif t in const.DOT:
			suitNumList[2] = 1
		elif t in const.DRAGONS or t in const.WINDS:
			honorNum = 1

	for meld in uptiles:
		for t in meld:
			if t in const.CHARACTER:
				suitNumList[0] = 1
			elif t in const.BAMBOO:
				suitNumList[1] = 1
			elif t in const.DOT:
				suitNumList[2] = 1
			elif t in const.DRAGONS or t in const.WINDS:
				honorNum = 1

	suitNum = sum([num for num in suitNumList])
	if suitNum > 1:
		return const.MIX_X_SUIT
	elif suitNum == 1:
		if honorNum == 1:
			return const.MIXED_ONE_SUIT
		else:
			return const.SAME_SUIT
	else:
		if honorNum == 1:
			return const.SAME_HONOR
		else:
			return const.MIX_X_SUIT


def checkIsPongPongWin(handTilesButKing, uptiles, kingTilesNum):
	for meld in uptiles:
		if (len(meld) != 3 and len(meld) != 4) or meld[0] != meld[-1]:
			return False
	tiles = handTilesButKing[:]
	tile2NumDict = getTile2NumDict(tiles)
	isDelete = False
	for t in tile2NumDict:
		if tile2NumDict[t] == 2:
			del tile2NumDict[t]
			isDelete = True
			break
	else:
		for t in tile2NumDict:
			if tile2NumDict[t] == 1:
				del tile2NumDict[t]
				kingTilesNum -= 1
				isDelete = True
				break
		else:
			for t in tile2NumDict:
				if tile2NumDict[t] == 4:
					del tile2NumDict[t]
					kingTilesNum -= 1
					isDelete = True
					break
			else:
				for t in tile2NumDict:
					if tile2NumDict[t] == 3:
						tile2NumDict[t] = 1
						isDelete = True
						break
	for t in tile2NumDict:
		needNum = abs(3 - tile2NumDict[t])
		kingTilesNum -= needNum
	if not isDelete or kingTilesNum < 0:
		return False
	return True


def getDiscardNum(player_op_r):
	DEBUG_MSG("player_op_r {0}".format(player_op_r))
	drawNum = 0
	for i in range(len(player_op_r) - 1, -1, -1):
		if player_op_r[i][0] == const.OP_DRAW:
			drawNum += 1
	return drawNum


# 杠上开花
def checkIsKongDrawWin(p_op_r):
	for i in range(len(p_op_r) - 1, -1, -1):
		DEBUG_MSG(p_op_r[i])
		if p_op_r[i][0] == const.OP_DRAW or p_op_r[i][0] == const.OP_CUT:
			continue
		if p_op_r[i][0] == const.OP_CONCEALED_KONG:
			return True, 1
		elif p_op_r[i][0] == const.OP_EXPOSED_KONG:
			return True, 2
		elif p_op_r[i][0] == const.OP_KONG_WREATH:
			return True, 3
		elif p_op_r[i][0] == const.OP_CONTINUE_KONG:
			return True, 4
		return False, 0
	return False, 0


# 七对头
def get7DoubleWin(handTiles, handTilesButKing, kingTilesNum, lastTile):
	if len(handTiles) != 14:
		return False, False, False
	tileDict = getTile2NumDict(handTilesButKing)
	need_kingtiles_num = 0
	isBrightTiles = False
	isDarkTiles = False
	for tile in tileDict:
		need_kingtiles_num += tileDict[tile] % 2
		if tileDict[tile] == 4:
			if tile == lastTile:
				isBrightTiles = True
			else:
				isDarkTiles = True
	# DEBUG_MSG("get7DoubleWin {0}, {1}".format(need_kingtiles_num,kingTilesNum))
	if kingTilesNum == need_kingtiles_num or need_kingtiles_num == 0:
		return True, isBrightTiles, isDarkTiles
	else:
		return False, False, False


# 十三不靠
def get13Mismatch(handTiles, kingTiles=None):
	if len(handTiles) != 14:
		return False
	kings, chars, bambs, dots, winds, dragons = classifyTiles(handTiles, kingTiles)
	winds_dragons = winds + dragons
	if len(chars) > 3 or len(bambs) > 3 or len(dots) > 3 or len(winds_dragons) > 7:
		return False
	kingTileNum = len(kings)
	if kingTileNum > 2:
		return False
	need_tiles_num = 5 - len(winds_dragons)
	if need_tiles_num > kingTileNum:
		return False

	char_dict = getTile2NumDict(chars)
	bambo_dict = getTile2NumDict(bambs)
	dot_dict = getTile2NumDict(dots)
	wind_dragon_dict = getTile2NumDict(winds_dragons)
	# 必须全部是单张
	if (len(char_dict) > 0 and max(char_dict.values()) > 1) \
			or (len(bambo_dict) > 0 and max(bambo_dict.values()) > 1) \
			or (len(dot_dict) > 0 and max(dot_dict.values()) > 1) \
			or (len(wind_dragon_dict) > 0 and max(wind_dragon_dict.values()) > 1):
		return False

	def check_is_match(tryList):
		size = len(tryList)
		if size <= 1:
			return True
		if size == 2:
			return tryList[1] - tryList[0] >= 3
		if size == 3:
			return tryList[1] - tryList[0] >= 3 and tryList[2] - tryList[1] >= 3
		return False

	if not check_is_match(chars) or not check_is_match(bambs) or not check_is_match(dots):
		return False

	flags = [False] * 3

	def tryFill(tryList):
		size = len(tryList)
		need = 3 - size
		if size > 0:
			tmp = int(tryList[0] / 10)
			if tmp == 0:
				index = 0
			elif tmp == 3:
				index = 1
			elif tmp == 5:
				index = 2
			else:
				return -1
			if not flags[index]:
				flags[index] = True
				return need
		return -1

	tile_group = [chars, bambs, dots]
	for group in tile_group:
		if len(group) == 0:
			need = 3
		else:
			need = tryFill(group)
		if need >= 0:
			need_tiles_num += need
		else:
			return False

	return need_tiles_num == kingTileNum


# 朋胡
def getFriendWin(uptiles, handTiles, handTilesButKing, kingTilesNum, p_wind, game_mode, prevailing_wind):
	for i in range(len(uptiles)):
		if uptiles[i][0] == uptiles[i][1]:
			return False

	for i in range(len(handTilesButKing)):
		tile = handTilesButKing[i]
		if game_mode == 0:
			if tile in const.DRAGONS or tile == const.WIND_EAST or tile == p_wind:
				return False
		elif game_mode == 1:
			if tile in const.DRAGONS or tile == prevailing_wind or tile == p_wind:
				return False

	handDict = getTile2NumDict(handTilesButKing)
	for tile in handDict:
		tilesButKings = handTilesButKing[:]
		del_num = 0
		if handDict[tile] >= 4:
			return
		if handDict[tile] == 3:
			for i in range(len(tilesButKings) - 1, -1, -1):
				if del_num == 2:
					break
				if tilesButKings[i] == tile:
					del tilesButKings[i]
					del_num += 1
			if getMeldNeed(tilesButKings) == kingTilesNum:
				return

	if kingTilesNum == 1 and meld_with_pair_need_num(handTiles, {}) == 0:
		return True

	if kingTilesNum == 2 and meld_with_pair_need_num(handTilesButKing, {}) == kingTilesNum:
		return True

	return False


# 十三幺
def getThirteenOrphans(handTilesButKing, kingTilesNum):
	if len(handTilesButKing) + kingTilesNum != 14:
		return False

	need_tiles = [1, 9, 31, 39, 51, 59]
	need_tiles.extend(const.WINDS_DRAGONS)

	def without_kings():
		for t in need_tiles:
			if t not in handTilesButKing:
				return False

		for t in need_tiles:
			if handTilesButKing.count(t) == 2:
				return True
		return False

	if kingTilesNum == 0:
		return without_kings()
	else:
		# 计算步骤
		# 移除手牌上已经需要的牌
		# 移除癞子牌
		win_need_tile = []
		handTilesButKing = list(handTilesButKing)
		for tile in need_tiles:
			if tile not in handTilesButKing:
				win_need_tile.append(tile)
			else:
				handTilesButKing.remove(tile)

		# 计算缺少的字牌
		# 如果字牌大于1张或者存在多张牌则不能胡

		count = len(handTilesButKing)
		if count > 1:
			return False
		elif count == 1 and handTilesButKing[0] not in need_tiles:
			return False
		need_sum = len(win_need_tile)
		if count == 0:
			need_sum += 1
		return need_sum == kingTilesNum


def getCanWinTiles(handTiles, kingTiles=None):
	result = []
	if len(handTiles) % 3 != 1:
		return result

	tryTiles = const.CHARACTER + const.BAMBOO + const.DOT + const.WINDS + const.DRAGONS
	for t in tryTiles:
		tmp = list(handTiles)
		tmp.append(t)
		tmp = sorted(tmp)
		if kingTiles is None or len(kingTiles) == 0:
			if canWinWithoutKing(tmp):
				result.append(t)
		else:
			if canWinWithKing(tmp, kingTiles):
				result.append(t)
	return result


def isWinTile(handTiles, kingTiles):
	length = len(handTiles)
	if length % 3 != 2:
		return False

	handCopyTiles = sorted(list(handTiles))
	classifyList = classifyTiles(handCopyTiles, kingTiles)
	kingTilesNum = len(classifyList[0])  # 百搭的数量
	handTilesButKing = []  # 除百搭外的手牌
	for i in range(1, len(classifyList)):
		handTilesButKing.extend(classifyList[i])

	is7Double, _, _ = checkIs7Pair(handCopyTiles, handTilesButKing, kingTilesNum + 1, classifyList[0], 0)
	if is7Double:
		return True
	return canWinWithKing3N2(handCopyTiles, kingTiles)


def canWinWithKing(handTiles, kingTiles):
	"""
	Attention: 正常的胡牌(3N + 2, 有赖子牌), 七对胡那种需要特殊判断, 这里不处理
	:param handTiles: 手牌
	:param kingTiles: 赖子牌列表
	:return: True or False
	"""
	if len(handTiles) % 3 != 2:
		return False

	kings, chars, bambs, dots, winds, dragons = classifyTiles(handTiles, kingTiles)
	kingTilesNum = len(kings)
	others = [chars, bambs, dots, winds, dragons]
	meld_need = []
	mos = mps = 0
	for tiles in others:
		mo = meld_only_need_num(tiles)
		mp = meld_with_pair_need_num(tiles)
		mos += mo
		mps += mp
		meld_need.append((mo, mp))

	for mo, mp in meld_need:
		if mp + (mos - mo) <= kingTilesNum:
			return True
	return False


def canWinWithoutKing(handTiles):
	"""
	Attention: 正常的的胡牌(3N + 2, 没有赖子), 七对胡那种需要特殊判断, 这里不处理
	:param handTiles: 手牌
	:return: True or False
	"""
	if len(handTiles) % 3 != 2:
		return False

	_, chars, bambs, dots, winds, dragons = classifyTiles(handTiles)
	hasPair = False

	for w in const.WINDS:
		n = winds.count(w)
		if n == 1:
			return False
		elif n == 2:
			if hasPair:
				return False
			hasPair = True
		else:
			continue

	for d in const.DRAGONS:
		n = dragons.count(d)
		if n == 1:
			return False
		elif n == 2:
			if hasPair:
				return False
			hasPair = True
		else:
			continue

	tiles = chars + bambs + dots
	if hasPair:
		return isMeld(tiles)
	else:
		return isMeldWithPair(tiles)


def isMeld(tiles):
	if (len(tiles) % 3 != 0):
		return False

	tilesCopy = sorted(tiles)
	total = sum(tiles)
	magic = total % 3
	if magic == 0:
		while (len(tilesCopy) >= 3):
			left = tilesCopy[0]
			n = tilesCopy.count(left)
			tilesCopy.remove(left)
			if n == 1:
				# 移除一个顺子
				if left + 1 in tilesCopy:
					tilesCopy.remove(left + 1)
				else:
					return False
				if left + 2 in tilesCopy:
					tilesCopy.remove(left + 2)
				else:
					return False
			elif n == 2:
				# 移除两个顺子
				tilesCopy.remove(left)
				if tilesCopy.count(left + 1) >= 2:
					tilesCopy.remove(left + 1)
					tilesCopy.remove(left + 1)
				else:
					return False
				if tilesCopy.count(left + 2) >= 2:
					tilesCopy.remove(left + 2)
					tilesCopy.remove(left + 2)
				else:
					return False
			else:
				# 移除一个刻子
				tilesCopy.remove(left)
				tilesCopy.remove(left)

	return len(tilesCopy) == 0


def isMeldWithPair(tiles):
	if (len(tiles) % 3 != 2):
		return False

	total = sum(tiles)
	magic = total % 3
	if magic == 0:
		possible = [3, 6, 9, 33, 36, 39, 51, 54, 57]
		return checkMeldInPossible(tiles, possible)
	elif magic == 1:
		possible = [2, 5, 8, 32, 35, 38, 53, 56, 59]
		return checkMeldInPossible(tiles, possible)
	elif magic == 2:
		possible = [1, 4, 7, 31, 34, 37, 52, 55, 58]
		return checkMeldInPossible(tiles, possible)
	return False


def checkMeldInPossible(tiles, possibleList):
	for i in possibleList:
		if tiles.count(i) >= 2:
			tmp = list(tiles)
			tmp.remove(i)
			tmp.remove(i)
			if isMeld(tmp):
				return True
	return False


def get_cur_timestamp():
	return int(time.time())

def get_seconds_till_n_days_later(begin, day, hour=0, minute=0, second=0):
	""" 获取第几天后的几点几分几秒的delta_time """
	dt = timedelta(days=day, hours=hour - begin.hour, minutes=minute - begin.minute, seconds=second - begin.second)
	seconds = dt.total_seconds()
	seconds = 0 if seconds <= 0 else seconds
	return seconds


def checkIs7Pair(handTiles, handTilesButKing, kingTilesNum, kingTiles, finalTile):
	# return 7对，暴头，杠数
	if len(handTiles) != 14:
		return False, False, 0
	needNum = 0
	tileDict = getTile2NumDict(handTilesButKing)
	meld_list = []
	for tile in tileDict:
		meld_list.append([tile] * tileDict[tile])
	for meld in meld_list:
		if len(meld) % 2 != 0:
			meld.append(-1)
			needNum += 1
	if needNum > kingTilesNum:
		return False, False, 0
	# 暴头
	isBaoTou = False
	if kingTilesNum > 0:
		if finalTile in kingTiles:  # 最后一张是财神 必须 财神凑成对子
			isBaoTou = kingTilesNum - needNum >= 2
		else:
			isBaoTou = any(finalTile in meld and -1 in meld for meld in meld_list) or kingTilesNum - needNum >= 2
	# 全部配对后，剩余必然是偶数
	restKingPairNum = int((kingTilesNum - needNum) / 2)
	pairNum = sum([1 for meld in meld_list if len(meld) == 2])
	kongPairNum = sum([1 for meld in meld_list if len(meld) == 4])

	return True, isBaoTou, kongPairNum + min(restKingPairNum, pairNum)


def winWith3N2NeedKing(handTilesButKing):
	"""
	Attention: 正常的胡牌(3N + 2), 七对胡那种需要特殊判断, 这里不处理，这里也不判断张数
	:param handTilesButKing: 除癞子牌外手牌
	:return: num #需要癞子牌数量
	"""
	_, chars, bambs, dots, winds, dragons = classifyTiles(handTilesButKing)
	meld_list = [chars, bambs, dots, winds, dragons]
	meld_need = []
	mos = mps = 0
	for tiles in meld_list:
		mo = meld_only_need_num(tiles)
		mp = meld_with_pair_need_num(tiles)
		mos += mo
		mps += mp
		meld_need.append((mo, mp))

	need_list = []
	for mo, mp in meld_need:
		need_list.append(mp + (mos - mo))
	return min(need_list)


def winWith3NNeedKing(handTilesButKing):
	"""
	Attention: 正常的胡牌(3N), 七对胡那种需要特殊判断, 这里不处理，这里也不判断张数
	:param handTilesButKing: 除癞子外牌
	:return: num #需要癞子牌数量
	"""
	_, chars, bambs, dots, winds, dragons = classifyTiles(handTilesButKing)
	meld_list = [chars, bambs, dots, winds, dragons]
	return sum([meld_only_need_num(tiles) for tiles in meld_list])


def canWinWithKing3N2(handTiles, kingTiles):
	"""
	Attention: 正常的胡牌(3N + 2, 有赖子牌), 七对胡那种需要特殊判断, 这里不处理
	:param handTiles: 手牌
	:param kingTiles: 赖子牌列表
	:return: True or False
	"""
	if len(handTiles) % 3 != 2:
		return False

	kings, chars, bambs, dots, winds, dragons = classifyTiles(handTiles, kingTiles)
	kingTilesNum = len(kings)
	others = [chars, bambs, dots, winds, dragons]
	meld_need = []
	mos = mps = 0
	for tiles in others:
		mo = meld_only_need_num(tiles)
		mp = meld_with_pair_need_num(tiles)
		mos += mo
		mps += mp
		meld_need.append((mo, mp))

	for mo, mp in meld_need:
		if mp + (mos - mo) <= kingTilesNum:
			return True
	return False


def get_continuous_dealer(arr):
	""" 获取玩家连庄次数 """
	count = 0
	for i in reversed(arr):
		if i == const.ROUND_RESULT_DEALER:
			count += 1
		elif i == const.ROUND_RESULT_END:
			continue
		else:
			return count
	return count

def getRoomParams(create_dict):
	return {
		'game_mode'			: create_dict['game_mode'],
		'pay_mode'			: create_dict['pay_mode'],
		'king_mode'			: create_dict['king_mode'],
		'game_round'		: create_dict['game_round'],
		'round_mode'		: create_dict['round_mode'],
		'base_score_mode'	: create_dict['base_score_mode'],
		'max_lose'			: create_dict['max_lose'],
		'score'				: create_dict['score'],
		'job'				: create_dict['job'],
		'discard_seconds'	: create_dict['discard_seconds'],
		'hand_prepare'		: create_dict['hand_prepare'],
		'room_type'			: create_dict['room_type'],
	}

def isValidUid(uid):
	if not isinstance(uid, int):
		return False
	if len(str(uid)) != 7:
		return False
	return True
