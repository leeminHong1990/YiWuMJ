var HelpUI = UIBase.extend({
    ctor: function () {
        this._super();
        this.resourceFilename = "res/ui/HelpUI.json";
        this.setLocalZOrder(const_val.MAX_LAYER_NUM);
    },

     show_by_info:function (info_dict) {
        this.info_dict = info_dict;
        this.show();
    },

    initUI: function () {
        var self = this;
        var player = h1global.entityManager.player();
        var help_panel = this.rootUINode.getChildByName("help_panel");

        var close_btn = help_panel.getChildByName("close_btn");

        var room_mode_btn = help_panel.getChildByName("room_mode_btn");
        var gamename_btn = help_panel.getChildByName("gamename_btn");
        room_mode_btn.setTouchEnabled(false);
        room_mode_btn.setBright(false);
        gamename_btn.setTouchEnabled(true);
        gamename_btn.setBright(true);

        var room_mode_panel = help_panel.getChildByName("room_mode_panel");
        var gamename_panel = help_panel.getChildByName("gamename_panel");
        room_mode_panel.setVisible(true);
        gamename_panel.setVisible(false);

        if(this.info_dict) {
            this.change_select("rule_chx_" + this.info_dict.round_mode.toString());
            if(this.info_dict.game_round !=undefined && this.info_dict.game_round != 9999){
				this.change_select("round_chx_" + (this.info_dict.game_round / 8 - 1).toString());
            }
            if(this.info_dict.maxRound !=undefined && this.info_dict.maxRound != 9999){
                this.change_select("round_chx_" + (this.info_dict.maxRound / 8 - 1).toString());
            }
            this.change_select("king_chx_" + this.info_dict.king_mode.toString());
            this.change_select("base_score_mode_chx_" + this.info_dict.base_score_mode.toString());
            this.change_select("job_chx_" + this.info_dict.job.toString());
	        this.change_select("pay_mode_chx_" + (this.info_dict.pay_mode > 1 ? 0 : this.info_dict.pay_mode).toString());
	        if (this.info_dict.pay_mode === const_val.CLUB_PAY_MODE) {
		        room_mode_panel.getChildByName("pay_mode_label_0").setString("老板支付");
            }
            if (this.info_dict.round_mode == 0) {
                room_mode_panel.getChildByName("round_label").setString("分数：");
                room_mode_panel.getChildByName("score_chx_0").setVisible(true);
                room_mode_panel.getChildByName("score_label_0").setVisible(true);
                room_mode_panel.getChildByName("round_chx_0").setVisible(false);
                room_mode_panel.getChildByName("round_chx_1").setVisible(false);
                room_mode_panel.getChildByName("round_chx_2").setVisible(false);
                room_mode_panel.getChildByName("round_label_0").setVisible(false);
                room_mode_panel.getChildByName("round_label_1").setVisible(false);
                room_mode_panel.getChildByName("round_label_2").setVisible(false);
            } else {
                room_mode_panel.getChildByName("round_label").setString("局数：");
                room_mode_panel.getChildByName("score_chx_0").setVisible(false);
                room_mode_panel.getChildByName("score_label_0").setVisible(false);
                room_mode_panel.getChildByName("round_chx_0").setVisible(true);
                room_mode_panel.getChildByName("round_chx_1").setVisible(true);
                room_mode_panel.getChildByName("round_chx_2").setVisible(true);
                room_mode_panel.getChildByName("round_label_0").setVisible(true);
                room_mode_panel.getChildByName("round_label_1").setVisible(true);
                room_mode_panel.getChildByName("round_label_2").setVisible(true);
            }
        }else {
            this.gamehall_show();
        }

        close_btn.addTouchEventListener(function (sender, eventType) {
            if (eventType === ccui.Widget.TOUCH_ENDED) {
                self.hide();
            }
        });

        room_mode_btn.addTouchEventListener(function (sender, eventType) {
            if (eventType === ccui.Widget.TOUCH_ENDED) {
                room_mode_btn.setTouchEnabled(false);
                room_mode_btn.setBright(false);
                gamename_btn.setTouchEnabled(true);
                gamename_btn.setBright(true);
                gamename_panel.setVisible(false);
                room_mode_panel.setVisible(true);
            }
        });

        gamename_btn.addTouchEventListener(function (sender, eventType) {
            if (eventType === ccui.Widget.TOUCH_ENDED) {
                gamename_btn.setTouchEnabled(false);
                gamename_btn.setBright(false);
                room_mode_btn.setTouchEnabled(true);
                room_mode_btn.setBright(true);
                room_mode_panel.setVisible(false);
                gamename_panel.setVisible(true);
            }
        });
    },

    change_select:function (chxName) {
        var chx = this.rootUINode.getChildByName("help_panel").getChildByName("room_mode_panel").getChildByName(chxName);
        chx.setBright(true);
    },

    gamehall_show:function () {
        var help_panel = this.rootUINode.getChildByName("help_panel");
        var room_mode_btn = help_panel.getChildByName("room_mode_btn");
        var gamename_btn = help_panel.getChildByName("gamename_btn");
        var line_img = help_panel.getChildByName("line_img");
        room_mode_btn.setVisible(false);
        line_img.setVisible(false);
        gamename_btn.setTouchEnabled(false);
        gamename_btn.setBright(false);
        gamename_btn.setPositionY(gamename_btn.getPositionY() + 100);

        var room_mode_panel = help_panel.getChildByName("room_mode_panel");
        var gamename_panel = help_panel.getChildByName("gamename_panel");
        room_mode_panel.setVisible(false);
        gamename_panel.setVisible(true);
    },
});