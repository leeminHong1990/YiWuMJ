"use strict";

var ClubRecordUI = UIBase.extend({
    ctor:function () {
        this._super();
        this.resourceFilename = "res/ui/ClubRecordUI.json";
    },

    show_by_info:function (club_id) {
        if(!h1global.player().club_entity_dict[club_id]){return}
        this.club = h1global.player().club_entity_dict[club_id];
        this.show();
    },

    initUI:function () {
        var self = this;
        var record_panel = this.rootUINode.getChildByName("record_panel");
        var return_btn = record_panel.getChildByName("return_btn");
        function return_btn_event(sender, eventType) {
            if (eventType === ccui.Widget.TOUCH_ENDED) {
                self.hide();
            }
        }
        return_btn.addTouchEventListener(return_btn_event);

        var record_all_btn = record_panel.getChildByName("record_all_btn");
        var record_mine_btn = record_panel.getChildByName("record_mine_btn");
        var dau_today_btn = record_panel.getChildByName("dau_today_btn");
        var dau_yesterday_btn = record_panel.getChildByName("dau_yesterday_btn");

        var record_all_scroll = record_panel.getChildByName("record_all_scroll");
        var record_mine_scroll = record_panel.getChildByName("record_mine_scroll");
        var dau_today_scroll = record_panel.getChildByName("dau_today_panel");
        var dau_yesterday_scroll = record_panel.getChildByName("dau_yesterday_panel");

	    this.btn_list = [record_all_btn, record_mine_btn, dau_today_btn, dau_yesterday_btn];
	    this.scroll_list = [record_all_scroll, record_mine_scroll, dau_today_scroll, dau_yesterday_scroll];

        UICommonWidget.create_tab(this.btn_list, this.scroll_list);
        h1global.player().clubOperation(const_val.CLUB_OP_GET_RECORDS, self.club.club_id);
        h1global.player().queryTodayDAU(self.club.club_id);
        h1global.player().queryYesterdayDAU(self.club.club_id);
    },
    
    update_recrod:function (club_id, record_list) {
        if(!this.is_show){return;}
        if(this.club.club_id !== club_id){return;}
        // 时间排序 从大到小
        record_list.sort(function (a, b) {
           return b.time - a.time;
        });
        // 分数排序 从 大到小
        for(var i=0; i<record_list.length; i++){
            record_list[i]["player_info_list"].sort(function (a,b) {
                return b.score - a.score;
            })
        }
        var group_record_list = this.group_record(record_list);

        for(var i=0; i<group_record_list.length; i++){
            this.update_scroll(this.scroll_list[i], group_record_list[i])
        }
    },

    update_scroll:function (scroll, info_list) {
        function init_panel_item(itemPanel, itemData, idx) {
            var room_id_label = itemPanel.getChildByName("room_id_label");
            var time_label = itemPanel.getChildByName("time_label");

            room_id_label.setString("房号:" + itemData["roomID"]);
            time_label.setString(cutil.convert_timestamp_to_mdhms(itemData["time"]));

            for(var i=0; i<itemData["player_info_list"].length; i++){
                var name_label = itemPanel.getChildByName("name_label_" + String(i));
                var score_label = itemPanel.getChildByName("score_label_" + String(i));

                var info = itemData["player_info_list"][i];
                name_label.setString(cutil.info_sub(info["nickname"], 7) + "(" + info["userId"].toString() + ")");
                score_label.setTextColor(cc.color(255, 255, 255));
                if(info["score"] > 0){
                    score_label.setString("+" + info["score"]);
                    score_label.setTextColor(cc.color(220, 56, 12));
                }else{
                    score_label.setString(info["score"]);
                    score_label.setTextColor(cc.color(26, 146, 95));
                }

                if(info["score"] >= itemData["player_info_list"][0]["score"]){
                    // 得分最多的人 名字特殊显示
                    name_label.setTextColor(cc.color(255, 255, 255));
                    name_label.setTextColor(cc.color(220, 56, 12));
                }
            }

        }
        UICommonWidget.update_scroll_items(scroll, info_list, init_panel_item);
    },
    
    group_record:function (record_list) {
        var group_record_list = [[], []];
        for(let i=0; i<record_list.length; i++){
            group_record_list[0].push(record_list[i]);
            // if(cutil.convert_timestamp_to_ymd(record_list[i]["time"]) !== cutil.convert_timestamp_to_ymd(Math.floor(Date.parse(new Date())/1000))){
            //     group_record_list[1].push(record_list[i]);
            // }

            var player_info_list = record_list[i]["player_info_list"];
            for(let j=0; j<player_info_list.length; j++){
                if(h1global.player().userId === player_info_list[j]["userId"]){
                    group_record_list[1].push(record_list[i]);
                    break;
                }
            }
        }
        return group_record_list
    },

	update_dau: function (club_id, dauList, queryType) {
		if (!this.is_show) {
			return;
		}
		if (this.club.club_id !== club_id) {
			return;
		}
		this.dauCache = this.dauCache || {};
		this.dauCache[queryType] = dauList;
		dauList.sort(function (a, b) {
			return b.count - a.count;
		});
		if (queryType === const_val.DAU_TODAY) {
			this.update_dau_scroll(this.scroll_list [2], dauList, const_val.DAU_TODAY);
		} else if (queryType === const_val.DAU_YESTERDAY) {
			this.update_dau_scroll(this.scroll_list [3], dauList, const_val.DAU_YESTERDAY);
		}
	},

	update_dau_scroll: function (panel, dauList , queryType) {
		var titlePanel = panel.getChildByName("title_panel");
		var club_id_label = titlePanel.getChildByName("club_id_label");
		club_id_label.setString("亲友圈号:" + this.club.club_id);
		var time_label = titlePanel.getChildByName("time_label");
		if (queryType === const_val.DAU_TODAY) {
			time_label.setString(cutil.convert_timestamp_to_ymd(new Date().getTime() / 1000));
			time_label.setVisible(true);
		} else if (const_val.DAU_YESTERDAY) {
			time_label.setString(cutil.convert_timestamp_to_ymd(new Date().getTime() / 1000 - 24 * 3600));
			time_label.setVisible(true);
		} else {
			time_label.setVisible(false);
		}
		var self = this;
		titlePanel.getChildByName("refresh_btn").addTouchEventListener(function (source, eventType) {
			if (eventType === ccui.Widget.TOUCH_ENDED) {
				if (queryType === const_val.DAU_TODAY) {
					h1global.player().queryTodayDAU(self.club.club_id);
				} else if (const_val.DAU_YESTERDAY) {
					h1global.player().queryYesterdayDAU(self.club.club_id);
				}
			}
		});

		var player = h1global.player();
		var myUserId = null;
		if (player) {
			myUserId = player.userId;
		}
		var scoreTitle = titlePanel.getChildByName("score_label");
		if (self.club.owner.userId !== myUserId) {
			scoreTitle.setVisible(false);

		}
		scoreTitle.setTouchEnabled(true);
		scoreTitle.addTouchEventListener(function (source, eventType) {
			if (eventType === ccui.Widget.TOUCH_ENDED) {
				self.dauCache[queryType].sort(function (a, b) {
					return b.score - a.score;
				});
				self.update_dau_scroll(panel, dauList , queryType)
			}
		});

		var countTitle = titlePanel.getChildByName("count_label");
		countTitle.setTouchEnabled(true);
		countTitle.addTouchEventListener(function (source, eventType) {
			if (eventType === ccui.Widget.TOUCH_ENDED) {
				self.dauCache[queryType].sort(function (a, b) {
					return b.count - a.count;
				});
				self.update_dau_scroll(panel, dauList , queryType)
			}
		});
		var totalCount = 0;
		for (var i = 0; i < dauList.length; i++) {
			totalCount+=dauList[i].count;
		}
		countTitle.ignoreContentAdaptWithSize(true);
		countTitle.setString("局数\n" + parseInt(totalCount / 4));

		var scroll = panel.getChildByName("dau_scroll");

		function init_panel_item(itemPanel, itemData, idx) {
			itemPanel.getChildByName("Image_21").setVisible(idx % 2 !== 1);
			var head_img_frame = itemPanel.getChildByName("head_img_frame");
			cutil.loadPortraitTexture(itemData["head_icon"], itemData["sex"], function (img) {
				if (self && self.is_show && cc.sys.isObjectValid(itemPanel)) {
					if (itemPanel.getChildByName("head_icon")) {
						itemPanel.removeChild(itemPanel.getChildByName("head_icon"))
					}
					var portrait_sprite = new cc.Sprite(img);
					portrait_sprite.setScale(52 / portrait_sprite.getContentSize().width);
					itemPanel.addChild(portrait_sprite);
					portrait_sprite.setPosition(head_img_frame.getPosition());
					portrait_sprite.setName("head_icon");
					itemPanel.reorderChild(portrait_sprite, head_img_frame.getLocalZOrder() - 1)
				}
			});
			itemPanel.getChildByName("name_label").setString(cutil.info_sub(itemData["nickname"], 7) + "(" + itemData["userId"] + ")");
			itemPanel.getChildByName("count_label").setString(itemData["count"]);
			let scoreLabel = itemPanel.getChildByName("score_label");

			if (self.club.owner.userId === myUserId) {
				scoreLabel.setVisible(true);
				if (itemData["score"] > 0) {
					scoreLabel.setString("+" + itemData["score"]);
					scoreLabel.setTextColor(cc.color(220, 56, 12));
				} else {
					scoreLabel.setString(itemData["score"]);
					scoreLabel.setTextColor(cc.color(26, 146, 95));
				}
			} else {
				scoreLabel.setVisible(false);
			}
		}

		UICommonWidget.update_scroll_items(scroll, dauList, init_panel_item);
	}
});