// var UIBase = require("src/views/ui/UIBase.js")
// cc.loader.loadJs("src/views/ui/UIBase.js")
"use strict"
var CreateRoomSnippet = UISnippet.extend({
	initUI:function(){
        this.room_type = undefined;
		this.game_mode = 0; //游戏模式，0代表普通模式，1代表庄家翻倍
		this.pay_mode = 0; //付费方式，0代表房主支付，1代表AA支付
        this.max_lose = 9999; // 用9999 表示无上限
        this.discard_seconds = 0;

        this.game_round = 8; //局数 4局、8局
        this.base_score_mode = 0;  //底注，即基础分，0是庄9闲7,1是庄13闲11
        this.job = const_val.MODE_JOB;	//承包，0是不承包，1是承包以及反承包
        this.score = 100;	//承包，0是不承包，1是承包以及反承包
        this.round_mode = 0; // 局数类型 0分数（分数为0结束），1长跑（按局数来）
        this.king_mode = const_val.KING_MODE_RANDOM;
        this.hand_prepare = 0; // 0代表需要手动准备，1代表不需要手动准备，因为在玩家的state中0代表没有准备,1代表已经准备
        this.createroom_panel = this.rootUINode.getChildByName("createroom_panel");
		this.gamename_panel = this.createroom_panel.getChildByName("gamename_panel");

		var self = this;

		//是否需要手动准备
		var prepare_chx = this.gamename_panel.getChildByName("prepare_chx");
		var prepare_label = this.gamename_panel.getChildByName("prepare_label");

        function prepare_chx_touchregion_event(sender, eventType) {
            if(eventType == ccui.Widget.TOUCH_ENDED) {
                if(self.hand_prepare == 0) {
                    prepare_chx.setSelected(false);
                    self.hand_prepare = 1;
                }else {
                    prepare_chx.setSelected(true);
                    self.hand_prepare = 0;
                }
            }
        }

        UICommonWidget.create_touch_region(
        	prepare_chx,
			cc.p(0, 0.5),
			cc.p(0, prepare_chx.getContentSize().height * 0.5),
			cc.size(prepare_chx.getContentSize().width + prepare_label.getString().length * prepare_label.getFontSize(), prepare_chx.getContentSize().height),
			prepare_chx_touchregion_event
		);

		this.updateCardDiamond(this.game_round);

		var chx_list = ["round_mode_chx","round_chx","score_chx","king_chx","base_score_mode_chx","job_chx","pay_mode_chx"];
		var chx_label_list = ["round_mode_label_", "round_num_label_", "score_label_", "king_label_", "base_score_mode_label_", "job_label_","pay_mode_label_"];
		var chx_num_list = [2,3,1,2,2,2,2];
		var chx_func_list = [
		    function (i) {
				self.round_mode = i;
				if(i === 0) {
					self.gamename_panel.getChildByName("round_label").setString("分数：");
                    self.gamename_panel.getChildByName("score_chx1").setVisible(true);
                    self.gamename_panel.getChildByName("score_label_1").setVisible(true);
					for (var i = 0 ; i < 3 ; i++) {
                        self.gamename_panel.getChildByName("round_chx" + (i + 1)).setVisible(false);
                        self.gamename_panel.getChildByName("round_num_label_" + (i + 1)).setVisible(false);
					}
                    self.updateCardDiamond(8);
				} else {
                    self.gamename_panel.getChildByName("round_label").setString("局数：");
                    self.gamename_panel.getChildByName("score_chx1").setVisible(false);
                    self.gamename_panel.getChildByName("score_label_1").setVisible(false);
                    for (var i = 0 ; i < 3 ; i++) {
                        self.gamename_panel.getChildByName("round_chx" + (i + 1)).setVisible(true);
                        self.gamename_panel.getChildByName("round_num_label_" + (i + 1)).setVisible(true);
                        self.gamename_panel.getChildByName("round_chx" + (i + 1)).setSelected(self.game_round / 8 == i + 1);
                        self.gamename_panel.getChildByName("round_chx1").setTouchEnabled(self.game_round / 8 != i + 1);
                    }
                    self.updateCardDiamond(self.game_round);
				}
		    },
            function (i) {self.game_round = 8*(i+1);self.updateCardDiamond(self.game_round);},
            function (i) {self.score = 100 * (i + 1);self.updateCardDiamond(8);},
            function (i) {self.king_mode = i === 0 ? const_val.KING_MODE_RANDOM : const_val.KING_MODE_FIXED;},
            function (i) {self.base_score_mode = i;},
            function (i) {self.job = i;},
            function (i) {
                if (self.room_type === const_val.CLUB_ROOM) {
                    self.pay_mode = i === 0 ? const_val.CLUB_PAY_MODE : const_val.AA_PAY_MODE;
                } else if (self.room_type === const_val.AGENT_ROOM) {
                    self.pay_mode = i === 0 ? const_val.AGENT_PAY_MODE : const_val.AA_PAY_MODE;
                } else {
                    self.pay_mode = i === 0 ? const_val.NORMAL_PAY_MODE : const_val.AA_PAY_MODE;
                }
                self.updateCardDiamond(self.game_round);
            }
        ];
		this.update_game_panel(this.createroom_panel, chx_list, chx_num_list, chx_label_list, chx_func_list);
	},

    //参数分别是一种游戏的面板、复选框名字的列表、对应复选框的个数列表、对应复选框的标签列表、对应要执行的函数的列表
	update_game_panel:function (game_panel, chx_list, chx_num_list, chx_label_list, chx_func_list) {
		var self = this;
		for(var i = 0 ; i < chx_list.length ; i++) {
            UICommonWidget.create_check_box_group(game_panel, chx_list[i], chx_num_list[i], chx_label_list[i], chx_func_list[i]);
        }
    },

	updateCardDiamond:function(game_round){
        var val = undefined;

        if (this.pay_mode === const_val.AA_PAY_MODE) {
            val = "每人消耗 x " + (game_round/8).toString();
        } else {
            if (this.room_type === const_val.CLUB_ROOM) {
                val = "老板消耗 x " + (game_round/8*3).toString();
            } else if (this.room_type === const_val.AGENT_ROOM) {
                val = "代理消耗 x " + (game_round/8*3).toString();
            } else {
                val = "房主消耗 x " + (game_round/8*3).toString();
            }
        }

		var cost_num_label = this.gamename_panel.getChildByName("cost_num_label");
        cost_num_label.setString(val);
	},

	getParameters: function () {
        if (this.round_mode === const_val.NORMAL_ROUND_MODE) {
            this.max_lose = this.score;
        }
		return {
			"pay_mode": this.pay_mode,
			"game_mode": this.game_mode,
            "discard_seconds": this.discard_seconds,
            "king_mode": this.king_mode,
            "game_round": this.game_round,
            "round_mode":this.round_mode,
            "base_score_mode":this.base_score_mode,
            "max_lose": this.max_lose,
            "score": this.score,
            "job": this.job,
			"hand_prepare": this.hand_prepare,
		};
	},

    updateRoomType: function (r_type) {
        this.room_type = r_type;
        var label_1 = this.gamename_panel.getChildByName("pay_mode_label_1");
        if (r_type === const_val.CLUB_ROOM) {
            label_1.setString("老板支付");
        } else if (r_type === const_val.AGENT_ROOM) {
            label_1.setString("代理支付");
        } else {
            label_1.setString("房主支付");
        }
        this.update_default_pay_mode();
        // this.update_mode_option();
        this.updateCardDiamond(this.game_round);
    },

    update_default_pay_mode: function () {
        switch (this.room_type) {
            case const_val.CLUB_ROOM:
                if (this.pay_mode !== const_val.AA_PAY_MODE) {
                    this.pay_mode = const_val.CLUB_PAY_MODE;
                }
                break;
            case const_val.AGENT_ROOM:
                if (this.pay_mode !== const_val.AA_PAY_MODE) {
                    this.pay_mode = const_val.AGENT_PAY_MODE;
                }
                break;
            default:
                if (this.pay_mode !== const_val.AA_PAY_MODE) {
                    this.pay_mode = const_val.NORMAL_PAY_MODE;
                }
        }
    },
});