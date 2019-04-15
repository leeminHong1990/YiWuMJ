"use strict";
/*-----------------------------------------------------------------------------------------
 interface
 -----------------------------------------------------------------------------------------*/
var impGameRules = impGameOperation.extend({
    __init__: function () {
        this._super();
        KBEngine.DEBUG_MSG("Create impGameRules");
    },

    getCanWinTiles: function (select_tile, serverSitNum, aid) {
        select_tile = select_tile || 0;
        serverSitNum = serverSitNum || this.serverSitNum;
        aid = aid || const_val.OP_DRAW_WIN;
        // var time1 = (new Date()).getTime();

        //听牌提示
        var canWinTiles = [];
        var handTiles = this.curGameRoom.handTilesList[serverSitNum].concat([]);
        var allTiles = [const_val.CHARACTER, const_val.BAMBOO, const_val.DOT, const_val.WINDS, const_val.DRAGONS]
        var select_tile_pos = handTiles.indexOf(select_tile);
        if (select_tile_pos >= 0) {
            handTiles.splice(select_tile_pos, 1);
        }
        for (var i = 0; i < allTiles.length; i++) {
            for (var j = 0; j < allTiles[i].length; j++) {
                var t = allTiles[i][j]
                var temp_handTiles = handTiles.concat([t]);
                if (this.canWin(temp_handTiles, t, serverSitNum, aid)) {
                    canWinTiles.push(t);
                }
            }
        }
        // var time2 = (new Date()).getTime();
        // cc.log("getCanWinTiles222 cost = ", time2 - time1);
        return canWinTiles;
    },

    canConcealedKong: function (tiles) {
        //暗杠
        if (this.getOneConcealedKongNum(tiles) > 0) {
            return true;
        } else {
            return false;
        }
    },

    getOneConcealedKongNum: function (tiles) {
        var hashDict = {};
        for (var i = 0; i < tiles.length; i++) {
            if (this.curGameRoom.kingTiles.indexOf(tiles[i]) >= 0) {
                continue;
            }
            if (hashDict[tiles[i]]) {
                hashDict[tiles[i]]++;
                if (hashDict[tiles[i]] >= 4) {
                    return tiles[i];
                }
            } else {
                hashDict[tiles[i]] = 1;
            }
        }
        return 0;
    },

    add_limit_tiles: function (idx, aid, tile) {
        var ops = this.curGameRoom.op_limit[idx] || {};
        var ts = ops[aid] || [];
        ts.push(tile);
        ops[aid] = ts;
        this.curGameRoom.op_limit[idx] = ops;
    },

    isOpLimit: function (serverSitNum, aid, t) {
        if (this.curGameRoom.op_limit[serverSitNum]) {
            let ops = this.curGameRoom.op_limit[serverSitNum];
            if (ops[aid] && ops[aid].indexOf(t) >= 0) {
                return true;
            }
        }
        return false;
    },

    /**
     * 吃牌的时候会出现最后剩下的手牌里面的牌都不能打出去，这种情况这个牌不应该能吃
     * @param serverSitNum
     * @param chowTilesList
     * @returns {boolean}
     */
    isOpChowLimit: function (serverSitNum, chowTilesList) {
        var limit_tiles = [];
        if (this.curGameRoom.op_limit[serverSitNum]) {
            let ops = this.curGameRoom.op_limit[serverSitNum];
            if (ops[const_val.OP_DISCARD]) {
                limit_tiles = ops[const_val.OP_DISCARD]
            }
        }
        var curGameRoom = this.curGameRoom;
        var tiles = curGameRoom.handTilesList[this.serverSitNum];
        tiles = tiles.concat([]);
        for (var i = 0; i < chowTilesList.length; i++) {
            var index = tiles.indexOf(chowTilesList[i]);
            if (index >= 0) {
                tiles.splice(index, 1)
            }
        }
        for (var i = 0; i < tiles.length; i++) {
            if (limit_tiles.indexOf(tiles[i]) < 0) {
                return false;
            }
        }
        return true;
    },

    getChowLimitTiles: function (chow_tiles_list) {
        var result = [];
        var chow_tile = chow_tiles_list[0];
        result.push(chow_tile);
        var _tmp = chow_tiles_list.concat([]);
        if (this.curGameRoom.king_mode == const_val.KING_MODE_RANDOM) {
            cutil.batch_replace(_tmp, const_val.DRAGON_WHITE, this.curGameRoom.kingTiles[0]);
            if (chow_tile == const_val.DRAGON_WHITE) {
                chow_tile = this.curGameRoom.kingTiles[0];
            }
        }
        _tmp.sort();
        if (_tmp[0] === chow_tile || _tmp[2] === chow_tile) {
            _tmp.splice(_tmp.indexOf(chow_tile), 1);
            var t0 = _tmp[0] - 1;
            var t1 = _tmp[1] + 1;

            if (t0 % 10 > 0) {
                if (this.curGameRoom.king_mode == const_val.KING_MODE_RANDOM) {
                    if (t0 === this.curGameRoom.kingTiles[0]) {
                        t0 = const_val.DRAGON_WHITE;
                    }
                }
                result.push(t0);
            }
            if (t1 % 10 <= 9) {
                if (this.curGameRoom.king_mode == const_val.KING_MODE_RANDOM) {
                    if (t1 === this.curGameRoom.kingTiles[0]) {
                        t1 = const_val.DRAGON_WHITE;
                    }
                }
                result.push(t1);
            }
        }
        return result;
    },

    canDiscard: function (t) {
        if (this.isOpLimit(this.serverSitNum, const_val.OP_DISCARD, t)) {
            return false;
        }
        let curGameRoom = this.curGameRoom;
        let tiles = curGameRoom.handTilesList[this.serverSitNum];
        if (curGameRoom.kingTiles && curGameRoom.kingTiles.indexOf(t) >= 0) {
            let kings = cutil.classifyTiles(tiles, curGameRoom.kingTiles)[0];
            return kings.length > 1;
        }
        return tiles.indexOf(t) >= 0;
    },

    canExposedKong: function (tiles, keyTile) {
        if (this.curGameRoom.kingTiles.indexOf(keyTile) >= 0) {
            return false;
        }
        var tile = 0;
        for (var i = 0; i < tiles.length; i++) {
            if (tiles[i] == keyTile) {
                tile++;
            }
        }
        if (tile >= 3) {
            return true;
        }
        return false;
    },

    canContinueKongTile: function (upTilesList, tile) {
        return this.getContinueKongUpIdx(upTilesList, tile) >= 0 ? true : false;
    },

    canContinueKongHandTiles: function (upTilesList, handTiles) {
        return this.getContinueKongTileList(upTilesList, handTiles).length > 0 ? true : false;
    },

    getContinueKongTileList: function (upTilesList, handTiles) {
        var tilelist = []
        for (var i = 0; i < handTiles.length; i++) {
            if (this.curGameRoom.kingTiles.indexOf(handTiles[i]) >= 0) {
                continue;
            }
            for (var j = 0; j < upTilesList.length; j++) {
                if (upTilesList[j].length == 3 && upTilesList[j][0] == upTilesList[j][1] && upTilesList[j][1] == upTilesList[j][2] && handTiles[i] == upTilesList[j][0]) {
                    tilelist.push(handTiles[i])
                }
            }
        }
        return tilelist
    },

    getContinueKongHandIdxList: function (upTilesList, handTiles) {
        var idxList = []
        for (var i = 0; i < handTiles.length; i++) {
            if (this.curGameRoom.kingTiles.indexOf(handTiles[i]) >= 0) {
                continue;
            }
            for (var j = 0; j < upTilesList.length; j++) {
                if (upTilesList[j].length == 3 && upTilesList[j][0] == upTilesList[j][1] && upTilesList[j][1] == upTilesList[j][2] && handTiles[i] == upTilesList[j][0]) {
                    idxList.push(i)
                }
            }
        }
        return idxList
    },

    getContinueKongUpIdx: function (upTilesList, tile) {
        if (this.curGameRoom.kingTiles.indexOf(tile) >= 0) {
            return -1;
        }
        for (var i = 0; i < upTilesList.length; i++) {
            if (upTilesList[i].length == 3 && tile == upTilesList[i][0] &&
                upTilesList[i][0] == upTilesList[i][1] && upTilesList[i][1] == upTilesList[i][2]) {
                return i;
            }
        }
        return -1;
    },

    canPong: function (tiles, keyTile) {
        if (this.curGameRoom.kingTiles.indexOf(keyTile) >= 0) {
            return false;
        }
        // 正常碰牌逻辑
        var tile = 0;
        for (var i = 0; i < tiles.length; i++) {
            if (tiles[i] == keyTile) {
                tile++;
            }
        }
        if (tile >= 2) {
            return true;
        }
        return false;
    },

    getCanChowTilesList: function (keyTile, serverSitNum) {
        var chowTilesList = [];
        if (this.curGameRoom.kingTiles.indexOf(keyTile) >= 0) {
            return chowTilesList
        }
        var intead = keyTile
        if (keyTile === const_val.DRAGON_WHITE && this.curGameRoom.kingTiles.length > 0) {
            intead = this.curGameRoom.kingTiles[0]
        }
        if (intead >= const_val.BOUNDARY) {
            return chowTilesList
        }
        var tiles = this.curGameRoom.handTilesList[serverSitNum];
        // 预处理
        tiles = cutil.deepCopy(tiles);
        for (let i = 0; i < this.curGameRoom.kingTiles.length; i++) {
            cutil.batch_delete(tiles, this.curGameRoom.kingTiles[i]);
        }
        if (this.curGameRoom.kingTiles.length > 0) {
            cutil.batch_replace(tiles, const_val.DRAGON_WHITE, this.curGameRoom.kingTiles[0]);
        }

        var match = [[-2, -1], [-1, 1], [1, 2]];
        for (var i = 0; i < match.length; i++) {
            var match_0 = match[i][0] + intead;
            var match_1 = match[i][1] + intead;
            if (tiles.indexOf(match_0) >= 0 && tiles.indexOf(match_1) >= 0) {
                if (this.curGameRoom.kingTiles.indexOf(match_0) >= 0) {
                    match_0 = const_val.DRAGON_WHITE;
                }
                if (this.curGameRoom.kingTiles.indexOf(match_1) >= 0) {
                    match_1 = const_val.DRAGON_WHITE;
                }
                var chow_arr = [keyTile, match_0, match_1];
                // if (!this.isOpChowLimit(serverSitNum, chow_arr)) {
                //     chowTilesList.push(chow_arr);
                // }
                chowTilesList.push(chow_arr);
            }
        }
        return chowTilesList;
    },

    getDrawOpDict: function (drawTile, serverSitNum) {
        drawTile = drawTile || 0;
        serverSitNum = serverSitNum || this.serverSitNum;
        var op_dict = {}
        var handTiles = this.curGameRoom.handTilesList[serverSitNum];
        var uptiles = this.curGameRoom.upTilesList[serverSitNum];
        //杠
        //接杠
        cc.log(handTiles, uptiles)
        for (var i = 0; i < handTiles.length; i++) {
            for (var j = 0; j < uptiles.length; j++) {
                var upMeld = uptiles[j]
                if (upMeld.length == 3 && upMeld[0] == upMeld[1] && upMeld[1] == upMeld[2] && upMeld[0] == handTiles[i]) {
                    if (!op_dict[const_val.OP_CONTINUE_KONG]) {
                        op_dict[const_val.OP_CONTINUE_KONG] = []
                    }
                    op_dict[const_val.OP_CONTINUE_KONG].push([handTiles[i]])
                }
            }
        }
        //暗杠
        var tile2NumDict = cutil.getTileNumDict(handTiles)
        for (var key in tile2NumDict) {
            if (this.isKingTile(eval(key))) {
                continue;
            }
            if (tile2NumDict[key] == 4) {
                if (!op_dict[const_val.OP_CONCEALED_KONG]) {
                    op_dict[const_val.OP_CONCEALED_KONG] = []
                }
                op_dict[const_val.OP_CONCEALED_KONG].push([eval(key)])
            }
        }
        //胡
        if (handTiles.length % 3 == 2 && this.canWin(handTiles, drawTile, serverSitNum, const_val.OP_DRAW_WIN)) {
            op_dict[const_val.OP_DRAW_WIN] = [[drawTile]]
        }
        //过
        if (Object.keys(op_dict).length > 0) {
            op_dict[const_val.OP_PASS] = [[drawTile]]
        }
        cc.log("getDrawOpDict==>:", op_dict, drawTile)
        return op_dict
    },

    getPongKongOpDict: function (serverSitNum) {
        serverSitNum = serverSitNum || this.serverSitNum;
        var op_dict = {}
        var handTiles = this.curGameRoom.handTilesList[serverSitNum];
        var uptiles = this.curGameRoom.upTilesList[serverSitNum];
        var lastOp = -1;
        var lastOpr = this.curGameRoom.players_op_r[serverSitNum];
        if (lastOpr.length > 0) {
            lastOp = lastOpr[lastOpr.length - 1][0];
        }
        //杠
        //接杠
        cc.log(handTiles, uptiles, lastOp);
        if (lastOp == const_val.OP_CHOW || lastOp == const_val.OP_PONG) {
            return op_dict;
        }
        for (var i = 0; i < handTiles.length; i++) {
            for (var j = 0; j < uptiles.length; j++) {
                var upMeld = uptiles[j]
                if (upMeld.length == 3 && upMeld[0] == upMeld[1] && upMeld[1] == upMeld[2] && upMeld[0] == handTiles[i]) {
                    if (!op_dict[const_val.OP_CONTINUE_KONG]) {
                        op_dict[const_val.OP_CONTINUE_KONG] = []
                    }
                    op_dict[const_val.OP_CONTINUE_KONG].push([handTiles[i]])
                }
            }
        }
        //暗杠
        var tile2NumDict = cutil.getTileNumDict(handTiles)
        for (var key in tile2NumDict) {
            if (tile2NumDict[key] == 4) {
                if (!op_dict[const_val.OP_CONCEALED_KONG]) {
                    op_dict[const_val.OP_CONCEALED_KONG] = []
                }
                op_dict[const_val.OP_CONCEALED_KONG].push([eval(key)])
            }
        }
        //过
        if (Object.keys(op_dict).length > 0) {
            op_dict[const_val.OP_PASS] = [[0]]
        }
        cc.log("getPongKongOpDict==>:", op_dict, serverSitNum);
        return op_dict
    },
    getWaitOpDict: function (wait_aid_list, tileList, serverSitNum) {
        serverSitNum = serverSitNum || this.serverSitNum;
        var op_dict = {};
        // 吃碰杠 胡
        for (var i = 0; i < wait_aid_list.length; i++) {
            if (wait_aid_list[i] === const_val.OP_CHOW) { // 吃要特殊处理，告诉服务端吃哪一组
                var canChowTileList = this.getCanChowTilesList(tileList[0], serverSitNum);
                if (canChowTileList.length > 0) {
                    op_dict[wait_aid_list[i]] = canChowTileList
                }
            } else {
                op_dict[wait_aid_list[i]] = [[tileList[0]]]
            }
        }
        if (Object.keys(op_dict).length > 0) {
            op_dict[const_val.OP_PASS] = [[tileList[0]]]
        }
        cc.log("getWaitOpDict==>", wait_aid_list, tileList, op_dict, serverSitNum);
        return op_dict
    },

    canWin: function (handTiles, finalTile, serverSitNum, aid) {
        // 平胡 7对 十三不靠
        if (handTiles.length % 3 !== 2) {
            return false;
        }
        serverSitNum = serverSitNum || this.serverSitNum;
        aid = aid || const_val.OP_DRAW_WIN;

        var handCopyTile = handTiles.concat([]);
        handCopyTile.sort(function (a, b) {
            return a - b;
        });

        let discardKingTotal = this.curGameRoom.discard_king_total;
        let maxDiscardKing = cutil.arrayMax(discardKingTotal);
        let idxDiscardKingNum = discardKingTotal[serverSitNum];
        // 自摸 抢杠胡算自摸
        let canDrawWin = aid === const_val.OP_DRAW_WIN || aid === const_val.OP_KONG_WIN;
        let canKongWin = cutil.checkIsKongDrawWin(this.curGameRoom.players_op_r[serverSitNum]);
        let handKingNum = 0;

        function match_win(baotou) {
            if (maxDiscardKing === 0) {
                if (handKingNum === 2) {
                    return canDrawWin;
                } else if (handKingNum > 2) {
                    return baotou || canKongWin;
                }
                return true;
            }
            if (maxDiscardKing === 1) {
				if (idxDiscardKingNum === 1) {
					if (canDrawWin) {
						return baotou;
					} else {
						return false;
					}
				} else {
					return canDrawWin;
				}
			} else {
				if (idxDiscardKingNum > 1) {
					return canDrawWin && baotou;
				} else {
					return canKongWin || baotou;
				}
			}
        }

        let kingTiles = this.curGameRoom.kingTiles;
        var classifyList = cutil.classifyWindTiles(handCopyTile, kingTiles);
        var handTilesButKing = classifyList[1];

        handKingNum = classifyList[0].length;
        // 7对
        let kingTilesNum = classifyList[0].length;
        var is7Double_baotou = cutil.checkIs7Pairs(handTilesButKing, kingTilesNum, kingTiles, finalTile);
        if (is7Double_baotou[0]) {
            if (match_win(is7Double_baotou[1] & (aid === const_val.OP_DRAW_WIN))) {
                if (is7Double_baotou[0] && (!is7Double_baotou[1] || (aid === const_val.OP_DRAW_WIN && is7Double_baotou[1]))) {
                    return true;
                }
            }
        }

        if (match_win(false)) {
            let is13Mismatch = cutil.get13Mismatch(handCopyTile, kingTiles);
            if (is13Mismatch) {
                return true;
            }
        }
        if (idxDiscardKingNum > 0 && kingTilesNum === 0) {
            // cc.warn('impossible: max_discard_king > 0 and hand king == 0', this.serverSitNum, discardKingTotal);
            return false;
        }
        let isBaotou = false;
        //白板顶财神
        for (var i = 0; i < handTilesButKing.length; i++) {
            if (handTilesButKing[i] === const_val.DRAGON_WHITE) {
                handTilesButKing[i] = this.curGameRoom.kingTiles[0]
            }
        }

        if (kingTilesNum > 0) {
            let insteadFinalTile = finalTile === const_val.DRAGON_WHITE ? kingTiles[0] : finalTile;

            if (kingTiles.indexOf(finalTile) >= 0) {
                if (cutil.get_count(handCopyTile, finalTile) >= 2) {
                    isBaotou = cutil.canNormalWinWithKing3N(handTilesButKing, kingTilesNum - 2);
                } else {
                    isBaotou = false;
                }
            } else {
                let newHandTilesButKing = handTilesButKing.concat();
                newHandTilesButKing.splice(newHandTilesButKing.indexOf(insteadFinalTile), 1);
                isBaotou = cutil.canNormalWinWithKing3N(newHandTilesButKing, kingTilesNum - 1)
            }
        }
        if (match_win(isBaotou) && ((isBaotou && aid === const_val.OP_DRAW_WIN) || !isBaotou)) {
            return cutil.canNormalWinWithKing3N2(handTilesButKing, kingTilesNum);
        } else {
            return false;
        }
    },

    isKingTile: function (tileNum) {
        if (this.curGameRoom.kingTiles && tileNum) {
            return this.curGameRoom.kingTiles.indexOf(tileNum) >= 0;
        }
        return false;
    }

});
