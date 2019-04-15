# -*- coding: utf-8 -*-

import KBEngine
import random

import const
import utility
from KBEDebug import *
from functools import cmp_to_key


class iRoomRules(object):

	def __init__(self):
		# 房间的牌堆
		self.tiles = []
		self.meld_dict = dict()

	def swapSeat(self, swap_list):
		random.shuffle(swap_list)
		for i in range(len(swap_list)):
			self.players_list[i] = self.origin_players_list[swap_list[i]]
			self.players_list[i].idx = i

	def setPrevailingWind(self):
		# 圈风
		if self.player_num != 4:
			return
		minDearerNum = min(self.dealerNumList)
		self.prevailing_wind = const.WINDS[(self.prevailing_wind + 1 - const.WIND_EAST) % len(const.WINDS)] if minDearerNum >= 1 else self.prevailing_wind
		self.dealerNumList = [0] * self.player_num if minDearerNum >= 1 else self.dealerNumList
		self.dealerNumList[self.dealer_idx] += 1

	def setPlayerWind(self):
		if self.player_num != 4:
			return
		# 位风
		for i, p in enumerate(self.players_list):
			if p is not None:
				p.wind = (self.player_num + i - self.dealer_idx) % self.player_num + const.WIND_EAST

	def initTiles(self):
		# 万 条 筒
		self.tiles = list(const.CHARACTER) * 4 + list(const.BAMBOO) * 4 + list(const.DOT) * 4
		# 东 西 南 北
		self.tiles += [const.WIND_EAST, const.WIND_SOUTH, const.WIND_WEST, const.WIND_NORTH] * 4
		# 中 发 白
		self.tiles += [const.DRAGON_RED, const.DRAGON_GREEN, const.DRAGON_WHITE] * 4
		# # 春 夏 秋 冬
		# self.tiles += [const.SEASON_SPRING, const.SEASON_SUMMER, const.SEASON_AUTUMN, const.SEASON_WINTER]
		# # 梅 兰 竹 菊
		# self.tiles += [const.FLOWER_PLUM, const.FLOWER_ORCHID, const.FLOWER_BAMBOO, const.FLOWER_CHRYSANTHEMUM]
		DEBUG_MSG("{} init tiles:{}".format(self.prefixLogStr, self.tiles))
		self.shuffle_tiles()

	def shuffle_tiles(self):
		random.shuffle(self.tiles)
		DEBUG_MSG("{} shuffle tiles:{}".format(self.prefixLogStr, self.tiles))

	def deal(self, prefabHandTiles, prefabTopList):
		""" 发牌 """
		if prefabHandTiles is not None:
			for i, p in enumerate(self.players_list):
				if p is not None and len(prefabHandTiles) >= 0:
					p.tiles = prefabHandTiles[i] if len(prefabHandTiles[i]) > const.INIT_TILE_NUMBER else \
						prefabHandTiles[i][0:const.INIT_TILE_NUMBER]
			topList = prefabTopList if prefabTopList is not None else []
			allTiles = []
			for i, p in enumerate(self.players_list):
				if p is not None:
					allTiles.extend(p.tiles)
			allTiles.extend(topList)

			tile2NumDict = utility.getTile2NumDict(allTiles)
			warning_tiles = [t for t, num in tile2NumDict.items() if num > 4]
			if len(warning_tiles) > 0:
				WARNING_MSG("{} prefab {} is larger than 4.".format(self.prefixLogStr, warning_tiles))
			for t in allTiles:
				if t in self.tiles:
					self.tiles.remove(t)
			for i in range(const.INIT_TILE_NUMBER):
				for j in range(self.player_num):
					if len(self.players_list[j].tiles) >= const.INIT_TILE_NUMBER:
						continue
					self.players_list[j].tiles.append(self.tiles.pop(0))

			newTiles = topList
			newTiles.extend(self.tiles)
			self.tiles = newTiles
		else:
			for i in range(const.INIT_TILE_NUMBER):
				for j in range(self.player_num):
					self.players_list[j].tiles.append(self.tiles[j])
				self.tiles = self.tiles[self.player_num:]

		for i, p in enumerate(self.players_list):
			DEBUG_MSG("{} idx:{} deal tiles:{}".format(self.prefixLogStr, i, p.tiles))

	def kongWreath(self):
		""" 杠花 """
		for i in range(self.player_num):
			for j in range(len(self.players_list[i].tiles) - 1, -1, -1):
				tile = self.players_list[i].tiles[j]
				if tile in const.SEASON or tile in const.FLOWER:
					del self.players_list[i].tiles[j]
					self.players_list[i].wreaths.append(tile)
					DEBUG_MSG("{} kong wreath, idx:{},tile:{}".format(self.prefixLogStr, i, tile))

	def addWreath(self):
		""" 补花 """
		for i in range(self.player_num):
			while len(self.players_list[i].tiles) < const.INIT_TILE_NUMBER:
				if len(self.tiles) <= 0:
					break
				tile = self.tiles[0]
				self.tiles = self.tiles[1:]
				if tile in const.SEASON or tile in const.FLOWER:
					self.players_list[i].wreaths.append(tile)
					DEBUG_MSG("{} add wreath, tile is wreath,idx:{},tile:{}".format(self.prefixLogStr, i, tile))
				else:
					self.players_list[i].tiles.append(tile)
					DEBUG_MSG("{} add wreath, tile is not wreath, idx:{},tile:{}".format(self.prefixLogStr, i, tile))

	def rollKingTile(self, prefabKingTiles):
		""" 财神 """
		self.kingTiles = []
		if prefabKingTiles is not None and len(prefabKingTiles) > 0:
			if self.king_mode == const.KING_MODE_FIXED:  # 财神模式 固定白板
				self.kingTiles.append(const.KING_FIXED_TILE)
			else:
				self.kingTiles.append(prefabKingTiles[0])
				for t in self.kingTiles:
					if t in self.tiles:
						self.tiles.remove(t)
		else:
			if self.king_num > 0:
				if self.king_mode == const.KING_MODE_FIXED:  # 财神模式 固定白板
					self.kingTiles.append(const.KING_FIXED_TILE)
				else:
					for i in range(len(self.tiles)):
						t = self.tiles[i]
						if t not in const.SEASON and t not in const.FLOWER:  # 第一张非花牌
							# 1-9为一圈 东南西北为一圈 中发白为一圈
							self.kingTiles.append(t)
							if self.king_num > 1:
								for tup in (const.CHARACTER, const.BAMBOO, const.DOT, const.WINDS, const.DRAGONS):
									if t in tup:
										index = tup.index(t)
										self.kingTiles.append(tup[(index + 1) % len(tup)])
										break
							del self.tiles[i]
							break

	def tidy(self):
		""" 整理 """
		for i in range(self.player_num):
			self.players_list[i].tidy(self.kingTiles)

	def throwTheDice(self, idxList):
		if self.player_num == 3:
			diceList = [[0, 0], [0, 0], [0, 0]]
		else:
			diceList = [[0, 0], [0, 0], [0, 0], [0, 0]]
		for idx in idxList:
			for i in range(0, 2):
				diceNum = random.randint(1, 6)
				diceList[idx][i] = diceNum
		return diceList

	def getMaxDiceIdx(self, diceList):
		numList = []
		for i in range(len(diceList)):
			numList.append(diceList[i][0] + diceList[i][1])

		idx = 0
		num = 0
		for i in range(len(numList)):
			if numList[i] > num:
				idx = i
				num = numList[i]
		return idx, num

	def getContinueKongFrom(self, op_r, tile):
		for record in reversed(op_r):
			if record[0] == const.OP_PONG and tile in record[1]:
				return record[2]
		return -1

	def getKongRecord(self):
		kong_record_list = []
		for i, p in enumerate(self.players_list):
			if p is not None:
				kong_record_list.extend(p.kong_record_list)
		return kong_record_list

	def swapTileToTop(self, tile):
		if tile in self.tiles:
			tileIdx = self.tiles.index(tile)
			self.tiles[0], self.tiles[tileIdx] = self.tiles[tileIdx], self.tiles[0]

	def winCount(self):
		pass

	def canTenPai(self, handTiles):
		length = len(handTiles)
		if length % 3 != 1:
			return False

		result = []
		tryTuple = (const.CHARACTER, const.BAMBOO, const.DOT, const.WINDS, const.DRAGONS)
		for tup in tryTuple:
			for t in tup:
				tmp = list(handTiles)
				tmp.append(t)
				tmp = sorted(tmp)
				if utility.isWinTile(tmp, self.kingTiles):
					result.append(t)
		return result != []

	def is_op_limit(self, idx, op, t):
		if idx in self.op_limit:
			limit = self.op_limit[idx]
			if op in limit:
				return t in limit[op]
		return False

	def is_op_chow_limit(self, idx, t):
		""" 吃牌的时候会出现最后剩下的手牌里面的牌都不能打出去，这种情况这个牌不应该能吃"""
		chow_list = self.get_can_chow_tiles_list(idx, t)
		if len(chow_list) == 0:
			return False
		limit_tiles = self.get_limit_tiles(idx, const.OP_DISCARD)
		king_limit = []
		if len(self.kingTiles) > 0:
			count = self.players_list[idx].tiles.count(self.kingTiles[0])
			if count == 1:
				king_limit.append(self.kingTiles[0])
		for chow_tile in chow_list:
			hand_tiles = self.players_list[idx].tiles[:]
			for tile in chow_tile:
				if tile in hand_tiles:
					hand_tiles.remove(tile)
			chow_limit_tiles = self.get_chow_limit_tiles(chow_tile)
			for tile in hand_tiles:
				if (tile not in limit_tiles) and (tile not in chow_limit_tiles) and tile not in king_limit:
					# DEBUG_MSG("is_op_chow_limit :{} {} {} {} {}".format(t, limit_tiles, chow_list, chow_limit_tiles, hand_tiles))
					return False
		return True

	def can_cut_after_kong(self):
		return False

	def can_discard(self, idx, tiles, t):
		if self.is_op_limit(idx, const.OP_DISCARD, t):
			return False
		if t in self.kingTiles:
			kings = utility.classifyTiles(tiles, self.kingTiles)[0]
			return len(kings) > 1
		else:
			return t in tiles

	def can_chow(self, idx, t):
		if self.is_op_limit(idx, const.OP_CHOW, t):
			return False
		if t in self.kingTiles:
			return False
		# 白板代替财神
		virtual_tile = self.kingTiles[0] if t == const.DRAGON_WHITE and len(self.kingTiles) > 0 else t
		if virtual_tile >= const.BOUNDARY:
			return False
		tiles = list(filter(lambda x: x not in self.kingTiles, self.players_list[idx].tiles))
		if self.king_mode == const.KING_MODE_RANDOM:
			tiles = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, tiles))
		MATCH = ((-2, -1), (-1, 1), (1, 2))
		for tup in MATCH:
			if all(val + virtual_tile in tiles for val in tup):
				return not self.is_op_chow_limit(idx, t)
		return False

	def can_chow_list(self, idx, tile_list):
		chow_list = list(tile_list)
		# """ 能吃 """
		if len(chow_list) != 3:
			return False
		if any(t in self.kingTiles for t in tile_list):
			return False
		virtual_chow_list = list(tile_list)
		virtual_chow_list = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, virtual_chow_list))
		if any(t >= const.BOUNDARY for t in virtual_chow_list):
			return False
		tiles = list(filter(lambda x: x not in self.kingTiles, self.players_list[idx].tiles))
		tiles = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, tiles))
		if virtual_chow_list[1] in tiles and virtual_chow_list[2] in tiles:
			sortLis = sorted(virtual_chow_list)
			if (sortLis[2] + sortLis[0]) / 2 == sortLis[1] and sortLis[2] - sortLis[0] == 2:
				return True
		return False

	def get_can_chow_tiles_list(self, idx, key_tile):
		chow_list = []
		hand_tiles = self.players_list[idx].tiles
		intead = key_tile
		if intead == const.DRAGON_WHITE and len(self.kingTiles) > 0:
			intead = self.kingTiles[0]
		if intead >= const.BOUNDARY:
			return chow_list
		hand_tiles = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, hand_tiles))
		match = ((-2, -1), (-1, 1), (1, 2))
		for i in range(len(match)):
			match_0 = match[i][0] + intead
			match_1 = match[i][1] + intead
			if match_0 in hand_tiles and match_1 in hand_tiles:
				if match_0 in self.kingTiles:
					match_0 = const.DRAGON_WHITE
				if match_1 in self.kingTiles:
					match_1 = const.DRAGON_WHITE
				chow_list.append([key_tile, match_0, match_1])
		return chow_list

	def can_pong(self, idx, tiles, t):
		""" 能碰 """
		if t in self.kingTiles:
			return False
		if self.is_op_limit(idx, const.OP_PONG, t):
			return False
		return sum([1 for i in tiles if i == t]) >= 2

	def can_exposed_kong(self, tiles, t):
		""" 能明杠 """
		if t in self.kingTiles:
			return False
		return tiles.count(t) == 3

	def can_continue_kong(self, player, t):
		""" 能够风险杠 """
		if t in self.kingTiles:
			return False
		if len(player.op_r) > 0 and (player.op_r[-1][0] == const.OP_PONG or player.op_r[-1][0] == const.OP_CHOW):
			return False
		for op in player.op_r:
			if op[0] == const.OP_PONG and op[1][0] == t:
				return True
		return False

	def can_concealed_kong(self, player, tiles, t):
		""" 能暗杠 """
		if t in self.kingTiles:
			return False
		if len(player.op_r) > 0 and (player.op_r[-1][0] == const.OP_PONG or player.op_r[-1][0] == const.OP_CHOW):
			return False
		return tiles.count(t) == 4

	def can_kong_wreath(self, tiles, t):
		if t in tiles and (t in const.SEASON or t in const.FLOWER):
			return True
		return False

	def can_wreath_win(self, wreaths):
		if len(wreaths) == len(const.SEASON) + len(const.FLOWER):
			return True
		return False

	def getNotifyOpList(self, idx, aid, tile):
		# notifyOpList 和 self.wait_op_info_list 必须同时操作
		# 数据结构：问询玩家，操作玩家，牌，操作类型，得分，结果，状态
		notifyOpList = [[] for i in range(self.player_num)]
		self.wait_op_info_list = []
		# 胡
		if aid == const.OP_KONG_WREATH and self.can_wreath_win(self.players_list[idx].wreaths):  # 8花胡
			opDict = {"idx": idx, "from": idx, "tileList": [tile, ], "aid": const.OP_WREATH_WIN, "score": 0, "result": [], "state": const.OP_STATE_WAIT}
			notifyOpList[idx].append(opDict)
			self.wait_op_info_list.append(opDict)
		elif aid == const.OP_EXPOSED_KONG:  # 直杠 抢杠胡
			wait_for_win_list = self.getExposedKongWinList(idx, tile)
			self.wait_op_info_list.extend(wait_for_win_list)
			for i in range(len(wait_for_win_list)):
				dic = wait_for_win_list[i]
				notifyOpList[dic["idx"]].append(dic)
		elif aid == const.OP_CONTINUE_KONG:  # 碰后接杠 抢杠胡
			wait_for_win_list = self.getKongWinList(idx, tile)
			self.wait_op_info_list.extend(wait_for_win_list)
			for i in range(len(wait_for_win_list)):
				dic = wait_for_win_list[i]
				notifyOpList[dic["idx"]].append(dic)
		elif aid == const.OP_DISCARD:
			# 胡(放炮胡)
			wait_for_win_list = self.getGiveWinList(idx, tile)
			self.wait_op_info_list.extend(wait_for_win_list)
			for i in range(len(wait_for_win_list)):
				dic = wait_for_win_list[i]
				notifyOpList[dic["idx"]].append(dic)
			# 杠 碰
			for i, p in enumerate(self.players_list):
				if p and i != idx:
					if self.can_exposed_kong(p.tiles, tile):
						opDict = {"idx": i, "from": idx, "tileList": [tile, ], "aid": const.OP_EXPOSED_KONG, "score": 0, "result": [], "state": const.OP_STATE_WAIT}
						self.wait_op_info_list.append(opDict)
						notifyOpList[i].append(opDict)
					if self.can_pong(i, p.tiles, tile):
						opDict = {"idx": i, "from": idx, "tileList": [tile, ], "aid": const.OP_PONG, "score": 0, "result": [], "state": const.OP_STATE_WAIT}
						self.wait_op_info_list.append(opDict)
						notifyOpList[i].append(opDict)
			# 吃
			nextIdx = self.nextIdx
			if self.can_chow(nextIdx, tile):
				opDict = {"idx": nextIdx, "from": idx, "tileList": [tile, ], "aid": const.OP_CHOW, "score": 0, "result": [], "state": const.OP_STATE_WAIT}
				self.wait_op_info_list.append(opDict)
				notifyOpList[nextIdx].append(opDict)
		return notifyOpList

	def getExposedKongWinList(self, idx, tile):
		wait_for_win_list = []
		# for i, p in enumerate(self.players_list):
		# 	if p is not None and i != idx:
		# 		# 抢直杠 卡张 必须卖宝
		# 		if p.discard_tiles and tile == p.discard_tiles[-1] and utility.getCanWinTiles(p.tiles) == [tile]:
		# 			DEBUG_MSG("getExposedKongWinList {}".format(i))
		# 			tryTiles = list(p.tiles)
		# 			tryTiles.append(tile)
		# 			tryTiles = sorted(tryTiles)
		# 			_, score, result = self.can_win(tryTiles, tile, const.OP_KONG_WIN, i)
		# 			wait_for_win_list.append({"idx": i, "from": idx, "tileList": [tile, ], "aid": const.OP_KONG_WIN, "score": score, "result": result, "state": const.OP_STATE_WAIT})
		# 		else:  # 平胡 可以 抢直杠
		# 			tryTiles = list(p.tiles)
		# 			tryTiles.append(tile)
		# 			tryTiles = sorted(tryTiles)
		# 			isWin, score, result = self.can_win(tryTiles, tile, const.OP_KONG_WIN, i)
		# 			if isWin and score == 1:
		# 				wait_for_win_list.append({"idx": i, "from": idx, "tileList": [tile, ], "aid": const.OP_KONG_WIN, "score": score, "result": result, "state": const.OP_STATE_WAIT})
		return wait_for_win_list

	# 抢杠胡 玩家列表
	def getKongWinList(self, idx, tile):
		wait_for_win_list = []
		for i in range(self.player_num - 1):
			ask_idx = (idx + i + 1) % self.player_num
			p = self.players_list[ask_idx]
			tryTiles = list(p.tiles)
			tryTiles.append(tile)
			tryTiles = sorted(tryTiles)
			DEBUG_MSG("{} getKongWinList {}".format(self.prefixLogStr, ask_idx))
			is_win, score, result = self.can_win(tryTiles, tile, const.OP_KONG_WIN, ask_idx)
			if is_win:
				wait_for_win_list.append({"idx": ask_idx, "from": idx, "tileList": [tile, ], "aid": const.OP_KONG_WIN, "score": score, "result": result, "state": const.OP_STATE_WAIT})
		return wait_for_win_list

	# 放炮胡 玩家列表
	def getGiveWinList(self, idx, tile):
		wait_for_win_list = []
		for i in range(self.player_num - 1):
			ask_idx = (idx + i + 1) % self.player_num
			p = self.players_list[ask_idx]
			tryTiles = list(p.tiles)
			tryTiles.append(tile)
			tryTiles = sorted(tryTiles)
			DEBUG_MSG("{} getGiveWinList {}".format(self.prefixLogStr, ask_idx))
			is_win, score, result = self.can_win(tryTiles, tile, const.OP_GIVE_WIN, ask_idx)
			if is_win:
				wait_for_win_list.append({"idx": ask_idx, "from": idx, "tileList": [tile, ], "aid": const.OP_GIVE_WIN, "score": score, "result": result, "state": const.OP_STATE_WAIT})
		return wait_for_win_list

	def can_win(self, handTiles, finalTile, win_op, idx):
		# 平胡 十三不搭 财神头 飘财 双飘 杠上开花
		# 庄9闲7 放炮胡 +1 自摸 *2 财神头 *4 单飘 *8 双飘 *16 三飘 *16
		result = [0] * 6  # 胡牌类型
		if len(handTiles) % 3 != 2:
			return False, 0, result

		if win_op == const.OP_WREATH_WIN:
			return False, 0, result

		if self.is_op_limit(idx, win_op, finalTile):
			return False, 0, result

		# 自摸 抢杠胡算自摸
		is_draw_win = win_op == const.OP_DRAW_WIN or win_op == const.OP_KONG_WIN
		# 杠开
		can_kong_win = False
		# 财神头
		isBaoTou = False
		handKingTileNum = 0
		for t in self.kingTiles:
			handKingTileNum = max(handKingTileNum, handTiles.count(t))

		p = self.players_list[idx]
		max_discard_king = max(self.discard_king_total)
		idx_discard_king_num = self.discard_king_total[idx]
		can_kong_win, kong_win_type = utility.checkIsKongDrawWin(p.op_r)

		def match_win(baotou):
			if max_discard_king == 0:
				if handKingTileNum == 2:
					multiply = 0
					if is_draw_win:
						if baotou or can_kong_win:
							multiply += 2
						else:
							multiply += 1
						return True, multiply
					return False, 0
				elif handKingTileNum > 2:
					if baotou or can_kong_win:
						return True, 2
					return False, 0
				else:
					multiply = 0
					if is_draw_win:
						if baotou or can_kong_win:
							multiply += 2
						else:
							multiply += 1
					return True, multiply
			elif max_discard_king == 1:
				if is_draw_win:
					if idx_discard_king_num == 1:
						if baotou:
							return True, 3
						else:
							return False, 0
					else:
						return True, 2 if baotou or can_kong_win else 1
				else:
					return False, 0
			else:
				if idx_discard_king_num > 1:
					if is_draw_win and baotou:
						return True, 4
					else:
						return False, 0
				else:
					if can_kong_win or baotou:
						return True, 2
					else:
						return False, 0

		if max_discard_king == 1:
			if win_op != const.OP_DRAW_WIN and win_op != const.OP_KONG_WIN:
				return False, 0, result
		elif max_discard_king > 1:
			if idx_discard_king_num > 1:
				if win_op != const.OP_DRAW_WIN:
					return False, 0, result
		# elif not can_kong_win:
		# 	# 不双飘的需要杠开
		# 	return False, 0, result

		handCopyTiles = list(handTiles)
		kings, handTilesButKing = utility.classifyWindTiles(handCopyTiles, self.kingTiles)
		kingTilesNum = len(kings)  # 百搭的数量

		tmp_can_win, tmp_quantity = match_win(False)
		if tmp_can_win:
			if utility.get13Mismatch(handCopyTiles, self.kingTiles):
				if tmp_can_win:
					# result[3] = 1
					result[0] = 1
					return True, tmp_quantity, result
				else:
					return False, 0, result

		is7Double, isBaoTou, kongNum = utility.checkIs7Pair(handCopyTiles, handTilesButKing, kingTilesNum, self.kingTiles, finalTile)
		# isBaoTou &= win_op == const.OP_DRAW_WIN  # 财神头必须自摸
		if is7Double:
			can_win, quantity = match_win(isBaoTou & (win_op == const.OP_DRAW_WIN))
			if can_win and (not isBaoTou or (isBaoTou and win_op == const.OP_DRAW_WIN)):
				# result[1] = 1
				if idx_discard_king_num == 1:
					result[3] = 1
				elif idx_discard_king_num > 1:
					result[4] = 1
				else:
					if can_kong_win or isBaoTou:
						if isBaoTou:
							result[2] = 1
						if can_kong_win:
							result[5] = 1
					else:
						result[0] = 1
				return True, quantity, result

		if idx_discard_king_num > 0 and kingTilesNum == 0:
			WARNING_MSG('{} impossible: max_discard_king > 0 and hand king == 0: idx:{},  {}'.format(self.prefixLogStr, idx, self.discard_king_total))
			return False, 0, result

		# 白板代替财神
		if self.king_mode == const.KING_MODE_RANDOM:
			handTilesButKing = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, handTilesButKing))
			insteadFinalTile = self.kingTiles[0] if finalTile == const.DRAGON_WHITE else finalTile
		else:
			insteadFinalTile = finalTile

		if kingTilesNum > 0:
			if finalTile in self.kingTiles:
				if handCopyTiles.count(finalTile) >= 2:
					need_king = utility.winWith3NNeedKing(handTilesButKing)
					isBaoTou = kingTilesNum - 2 >= need_king
				else:
					isBaoTou = False
			else:
				tmp = handTilesButKing[:]
				tmp.remove(insteadFinalTile)
				need_king = utility.winWith3NNeedKing(tmp)
				isBaoTou = kingTilesNum - 1 >= need_king
		else:
			isBaoTou = False

		# isBaoTou &= (win_op == const.OP_DRAW_WIN)  # 财神头必须自摸或抢杠胡
		can_win, quantity = match_win(isBaoTou & (win_op == const.OP_DRAW_WIN))
		if can_win:
			if kingTilesNum == 0:
				if utility.canWinWithoutKing(handTilesButKing):
					if idx_discard_king_num == 1:
						result[3] = 1
					elif idx_discard_king_num > 1:
						result[4] = 1
					else:
						if isBaoTou and win_op != const.OP_DRAW_WIN:
							return False, 0, result
						if can_kong_win or isBaoTou:
							if isBaoTou:
								result[2] = 1
							if can_kong_win:
								result[5] = 1
						else:
							result[0] = 1
					return True, quantity, result
				return False, 0, result
			else:
				if utility.winWith3N2NeedKing(handTilesButKing) <= kingTilesNum:
					if idx_discard_king_num == 1:
						result[3] = 1
					elif idx_discard_king_num > 1:
						result[4] = 1
					else:
						if isBaoTou and win_op != const.OP_DRAW_WIN:
							return False, 0, result
						if can_kong_win or isBaoTou:
							if isBaoTou:
								result[2] = 1
							if can_kong_win:
								result[5] = 1
						else:
							result[0] = 1
					return True, quantity, result
				return False, 0, result

		return False, 0, result

	def cal_job(self, win_idx, from_idx, to_idx, scores):
		"""
		:param win_idx: 赢的玩家
		:param from_idx: 吃碰杠方
		:param to_idx: 被吃碰杠方
		:param scores: 玩家的基本分数 必然只有一个人是正分
		"""
		tmp = list(map(lambda x: abs(x), scores))
		result = [0] * 4
		if win_idx == from_idx:  # 承包方赢
			result[from_idx] = tmp[from_idx]
			result[to_idx] = - tmp[from_idx]
		elif win_idx == to_idx:  # 被承包方赢
			result[from_idx] = -tmp[win_idx] * 2
			result[win_idx] = tmp[win_idx] * 2
		else:
			result = scores[:]
		return result

	def job_relation(self):
		"""
		:return: 玩家间的承包关系 (from , to)
		"""
		relations = []
		include_op_list = [const.OP_CHOW, const.OP_PONG, const.OP_EXPOSED_KONG]

		for idx, p in enumerate(self.players_list):
			before_discard_king = {}
			after_discard_king = {}
			all_discard_king = {}
			discard_index = self.discard_king_index[idx]
			for i, op in enumerate(p.op_r):
				from_idx = op[2]
				op_id = op[0]
				if i < discard_index:
					if from_idx != idx and op_id in include_op_list:
						count = before_discard_king.get(from_idx, 0) + 1
						before_discard_king[from_idx] = count
						all_discard_king[from_idx] = all_discard_king.get(from_idx, 0) + 1
				else:
					if from_idx != idx and op_id in include_op_list:
						count = after_discard_king.get(from_idx, 0) + 1
						after_discard_king[from_idx] = count
						all_discard_king[from_idx] = all_discard_king.get(from_idx, 0) + 1

			for from_idx in before_discard_king:
				if before_discard_king[from_idx] > 2:
					job = (idx, from_idx)
					not relations.__contains__(job) and relations.append(job)
			for from_idx in after_discard_king:
				if after_discard_king[from_idx] > 1:
					job = (idx, from_idx)
					not relations.__contains__(job) and relations.append(job)
			for from_idx in all_discard_king:
				if all_discard_king[from_idx] > 2:
					job = (idx, from_idx)
					not relations.__contains__(job) and relations.append(job)

		return relations

	def cal_all_job(self, win_idx, scores):
		relations = self.job_relation()
		DEBUG_MSG('{} cal_job info: win: {}, {} , {}'.format(self.prefixLogStr, win_idx, relations, scores))
		relations = list(filter(lambda x: win_idx in x, relations))
		if len(relations) > 0:
			real_scores = [0] * self.player_num
			for r in relations:
				result = self.cal_job(win_idx, r[0], r[1], scores)
				for i, v in enumerate(result):
					real_scores[i] += v
			return real_scores, True
		return scores, False

	def cal_score(self, idx, fromIdx, aid, quantity):
		"""
		:param quantity: 包含飘财倍数
		:return:
		"""
		# 飘的人输需要赔飘的倍数给赢的人
		is_dealer = self.dealer_idx == idx
		multiply = 2 ** quantity
		game_scores = const.BASE_SCORE_LIST[self.base_score_mode]

		# 双飘失败需要赔一个财神头
		def lose_discard_king(index):
			# if self.discard_king_total[index] == 1:
			# 	return 1
			# elif self.discard_king_total[index] > 1:
			# 	return 4
			# return 1
			return 1

		if aid == const.OP_EXPOSED_KONG:
			pass
		elif aid == const.OP_CONTINUE_KONG:
			pass
		elif aid == const.OP_CONCEALED_KONG:
			pass
		elif aid == const.OP_DRAW_WIN or aid == const.OP_KONG_WIN or aid == const.OP_GIVE_WIN:
			base_scores = [game_scores[0] if i == self.dealer_idx else game_scores[1] for i in range(self.player_num)]
			if aid == const.OP_GIVE_WIN:
				base_scores[fromIdx] += 1
			scores = [0] * self.player_num
			if is_dealer:
				for i, p in enumerate(self.players_list):
					if i != idx:
						lose_with_king_multiply = lose_discard_king(i)
						if i == fromIdx and aid == const.OP_GIVE_WIN:
							scores[i] -= ((1 + base_scores[idx] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[i]) * multiply * lose_with_king_multiply)
							scores[idx] += ((1 + base_scores[idx] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[i]) * multiply * lose_with_king_multiply)
						else:
							scores[i] -= ((base_scores[idx] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[i]) * multiply * lose_with_king_multiply)
							scores[idx] += ((base_scores[idx] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[i]) * multiply * lose_with_king_multiply)
			else:
				for i, p in enumerate(self.players_list):
					if i != idx:
						lose_with_king_multiply = lose_discard_king(i)
						if i == self.dealer_idx:
							scores[idx] += ((base_scores[i] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[idx]) * multiply * lose_with_king_multiply)
							scores[i] -= ((base_scores[i] + self.extra_mai_list[idx] + self.extra_mai_list[i] + self.extra_xia_list[idx]) * multiply * lose_with_king_multiply)
						else:
							scores[idx] += ((base_scores[i] + self.extra_mai_list[idx] + self.extra_mai_list[i]) * multiply * lose_with_king_multiply)
							scores[i] -= ((base_scores[i] + self.extra_mai_list[idx] + self.extra_mai_list[i]) * multiply * lose_with_king_multiply)

			real_scores = scores
			has_job = False
			if self.job == const.MODE_JOB:
				real_scores, has_job = self.cal_all_job(idx, scores)
				if has_job:
					for i in range(len(real_scores)):
						self.players_list[i].add_job_score(real_scores[i])
			if not has_job:
				if self.round_mode == const.ROUND_MODE_ROUND:
					for i, p in enumerate(self.players_list):
						p.add_score(real_scores[i])
				else:
					DEBUG_MSG("{} real_scores: {}".format(self.prefixLogStr, real_scores))
					win_player = self.players_list[idx]
					for i, p in enumerate(self.players_list):
						if i != idx:
							s = p.add_score(real_scores[i])
							win_player.add_score(abs(s))
		elif aid == const.OP_WREATH_WIN:
			pass

	def cal_draw_end(self):
		# 算基本分
		discard2king_index = None
		for i, v in enumerate(self.discard_king_total):
			if v > 1:
				discard2king_index = i

		if discard2king_index is not None:
			is_dealer = discard2king_index == self.dealer_idx
			game_scores = const.BASE_SCORE_LIST[self.base_score_mode]
			base_scores = [game_scores[0] if i == self.dealer_idx else game_scores[1] for i in range(self.player_num)]
			scores = [0] * self.player_num
			if is_dealer:
				for i, p in enumerate(self.players_list):
					if i != discard2king_index:
						scores[i] += ((base_scores[discard2king_index] + self.extra_mai_list[discard2king_index] + self.extra_mai_list[i]) * 4)
						scores[discard2king_index] -= ((base_scores[discard2king_index] + self.extra_mai_list[discard2king_index] + self.extra_mai_list[i]) * 4)
			else:
				for i, p in enumerate(self.players_list):
					if i != discard2king_index:
						scores[i] += ((base_scores[i] + self.extra_mai_list[discard2king_index] + self.extra_mai_list[i]) * 4)
						scores[discard2king_index] -= ((base_scores[i] + self.extra_mai_list[discard2king_index] + self.extra_mai_list[i]) * 4)

			for idx, p in enumerate(self.players_list):
				p.add_job_score(scores[idx])

	def add_limit_tiles(self, idx, aid, tiles):
		_ops = self.op_limit.get(idx, {})
		ts = _ops.get(aid, [])
		ts.extend(tiles)
		_ops[aid] = ts
		self.op_limit[idx] = _ops

	def get_limit_tiles(self, idx, aid):
		if idx in self.op_limit:
			_ops = self.op_limit
			if aid in _ops:
				return _ops[aid]
		return []

	def get_chow_limit_tiles(self, chow_list):
		chow_tile = chow_list[0]
		result = [chow_tile]
		_tmp = None
		if self.king_mode == const.KING_MODE_RANDOM:
			_tmp = list(map(lambda x: self.kingTiles[0] if x == const.DRAGON_WHITE else x, chow_list))
			if chow_tile == const.DRAGON_WHITE:
				chow_tile = self.kingTiles[0]
		else:
			_tmp = list(chow_list)
		_tmp = sorted(_tmp)

		if chow_tile == _tmp[0] or chow_tile == _tmp[2]:
			_tmp.remove(chow_tile)
			t0 = _tmp[0] - 1
			t1 = _tmp[1] + 1
			if t0 % 10 > 0:
				if self.king_mode == const.KING_MODE_RANDOM:
					t0 = const.DRAGON_WHITE if len(self.kingTiles) > 0 and t0 == self.kingTiles[0] else t0
				result.append(t0)
			if t1 % 10 <= 9:
				if self.king_mode == const.KING_MODE_RANDOM:
					t1 = const.DRAGON_WHITE if len(self.kingTiles) > 0 and t1 == self.kingTiles[0] else t1
				result.append(t1)
		# DEBUG_MSG("chow limit: {} : {} {}".format(result, chow_list, _tmp))
		return result

	def record_pass_op(self, wait_op_info_list):
		# 记录出牌限制
		if len(wait_op_info_list) == 0:
			return
		# idx (aid - data)
		wait_op_info_dict = {}
		for op_dict in wait_op_info_list:
			aid = op_dict['aid']
			tiles = op_dict['tileList']
			state = op_dict['state']
			idx = op_dict['idx']
			wait_op_info_dict[(idx, aid)] = (tiles, state)

		# 按优先级降序
		def compare(a, b):
			a_idx = a[0]
			a_aid = a[1]
			b_idx = b[0]
			b_aid = b[1]
			if a_aid == b_aid:
				num = self.player_num
				if a_idx == num - 1:
					a_idx = -1
				if b_idx == num - 1:
					b_idx = -1
				return a_idx - b_idx
			else:
				return b_aid - a_aid

		idx_aids = wait_op_info_dict.keys()
		sorted(idx_aids, key=cmp_to_key(compare))

		for idx_aid in idx_aids:
			idx = idx_aid[0]
			aid = idx_aid[1]
			op_info = wait_op_info_dict[idx_aid]
			tile_list = op_info[0]
			if op_info[1] == const.OP_STATE_PASS:
				if aid == const.OP_PONG or aid == const.OP_DRAW_WIN or aid == const.OP_CONTINUE_KONG or aid == const.OP_KONG_WIN or aid == const.OP_WREATH_WIN or aid == const.OP_GIVE_WIN:
					self.add_limit_tiles(idx, aid, tile_list)
			if op_info[1] == const.OP_STATE_SURE:
				break

	def clear_op_limit(self, idx):
		# 清除出牌限制
		if idx in self.op_limit:
			del self.op_limit[idx]
