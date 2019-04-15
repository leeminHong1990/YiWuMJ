// cc.loader.loadJs("src/views/uimanager/LoginSceneUIManager.js")

var GameRoomScene = cc.Scene.extend({
    className:"GameRoomScene",
    onEnter:function () {
        this._super();
        if (cc.sys.localStorage.getItem("GAME_ROOM_UI") == null) {
            cc.sys.localStorage.setItem("GAME_ROOM_UI", const_val.GAME_ROOM_2D_UI)
        }
        if (cc.sys.localStorage.getItem("GAME_ROOM_BG") == null) {
            cc.sys.localStorage.setItem("GAME_ROOM_BG", const_val.GAME_ROOM_BG_CLASSIC);
        }
        this.loadUIManager();
        cutil.unlock_ui();

        if(cc.audioEngine.isMusicPlaying()){
            cc.audioEngine.stopMusic();
        }
        if(!cc.audioEngine.isMusicPlaying()){
            cc.audioEngine.playMusic("res/sound/music/game_bgm.mp3", true);
        }
    },

    loadUIManager:function() {
    	var curUIManager = new GameRoomSceneUIManager();
    	curUIManager.setAnchorPoint(0, 0);
    	curUIManager.setPosition(0, 0);
    	this.addChild(curUIManager, const_val.curUIMgrZOrder);
        h1global.curUIMgr = curUIManager;

        if(h1global.entityManager.player().startActions["GameRoomScene"]){
            h1global.entityManager.player().startActions["GameRoomScene"]();
            h1global.entityManager.player().startActions["GameRoomScene"] = undefined;
        } else if(h1global.entityManager.player().curGameRoom.room_state == const_val.ROOM_PLAYING){
            // curUIManager.gameroomprepare_ui.hide();
            if(h1global.curUIMgr.gameroom3d_ui && h1global.curUIMgr.gameroom2d_ui){
                h1global.curUIMgr.roomLayoutMgr.notifyObserver(const_val.GAME_ROOM_UI_NAME, "hide");
                h1global.curUIMgr.showGameRoomUI(function(complete){
                    if(complete){
                        let player = h1global.entityManager.player();
                        if (player && player.startActions["GameRoomUI"]) {
                            player.startActions["GameRoomUI"]();
                            player.startActions["GameRoomUI"] = undefined;
                        }
                        h1global.curUIMgr.setGameRoomUI2Top(cc.sys.localStorage.getItem("GAME_ROOM_UI"))
                    }
                });
            }
        } else {
            h1global.curUIMgr.roomLayoutMgr.notifyObserver(const_val.GAME_ROOM_UI_NAME, "hide");
            var player = h1global.entityManager.player();
            if(player && player.curGameRoom){
                curUIManager.gameroomprepare_ui.show_prepare(player.curGameRoom.curRound, null, function () {
                    var player = h1global.entityManager.player();
                    if (player && player.curGameRoom) {
                        if (player.curGameRoom.curRound > 0) {
                            curUIManager.gameroomprepare_ui.updateExtraScorePanel(const_val.EXTRA_OP_XIA, player.curGameRoom.extra_xia_list);
                            // 断线重连需要更新按钮状态
                            curUIManager.gameroomprepare_ui.updateExtraState()
                        } else if (player.curGameRoom.playerStateList.indexOf(0) < 0) {
                            h1global.curUIMgr.gameroomprepare_ui.swap_seat(null, function () {
                                curUIManager.gameroomprepare_ui.updateExtraScorePanel(const_val.EXTRA_OP_XIA, player.curGameRoom.extra_xia_list);
                                // 断线重连需要更新按钮状态
                                curUIManager.gameroomprepare_ui.updateExtraState()
                            });
                        }
                        // curUIManager.gameroomprepare_ui.updateExtraScorePanel(const_val.EXTRA_OP_XIA, player.curGameRoom.extra_xia_list);
                        // // 断线重连需要更新按钮状态
                        // curUIManager.gameroomprepare_ui.updateExtraState()
                        // for (var i = 0; i < player.curGameRoom.extra_score_state.length; i++) {
                        //     var state = player.curGameRoom.extra_score_state[i];
                        //     if (state === const_val.EXTRA_STATE_OP_DISABLE || state === 0) {
                        //         curUIManager.gameroomprepare_ui.updateExtraView(i, const_val.EXTRA_OP_CANCEL, 0, true)
                        //     } else {
                        //         if ((state & const_val.EXTRA_STATE_OP_XIA) === const_val.EXTRA_STATE_OP_XIA) {
                        //             curUIManager.gameroomprepare_ui.updateExtraView(i, const_val.EXTRA_OP_XIA, 0, true)
                        //         }
                        //         if ((state & const_val.EXTRA_STATE_OP_MAI) === const_val.EXTRA_STATE_OP_MAI) {
                        //             curUIManager.gameroomprepare_ui.updateExtraView(i, const_val.EXTRA_OP_XIA, 0, true)
                        //         }
                        //     }
                        // }
                    }
                });
            }
        }

        if (!onhookMgr) { 
            onhookMgr = new OnHookManager();
        }

        onhookMgr.init(this);
        this.scheduleUpdateWithPriority(0);

        if(onhookMgr.applyCloseLeftTime > 0){
            curUIManager.applyclose_ui.show_by_sitnum(h1global.entityManager.player().curGameRoom.applyCloseFrom);
        }
    },

    update:function( delta ){
        // if (physicsUpdate) {
        //     physicsUpdate();
        // }
        onhookMgr.update(delta);
    }
});