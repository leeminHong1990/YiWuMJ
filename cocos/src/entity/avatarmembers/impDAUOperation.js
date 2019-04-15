"use strict";
/*-----------------------------------------------------------------------------------------
												interface
-----------------------------------------------------------------------------------------*/
var impDAUOperation = impPlaybackOperation.extend({
	__init__: function () {
		this._super();
		KBEngine.DEBUG_MSG("Create impDAUOperation");
	},

	queryTodayDAU: function (clubId) {
		this.baseCall("queryTodayDAU", clubId);
	},

	queryYesterdayDAU: function (clubId) {
		this.baseCall("queryYesterdayDAU", clubId);
	},

	queryDAUResult: function (club_id, dauList, queryType) {
		cc.log("queryDAUResult");
		cc.log(dauList, queryType);
		if (h1global.curUIMgr.clubrecord_ui && h1global.curUIMgr.clubrecord_ui.is_show) {
			h1global.curUIMgr.clubrecord_ui.update_dau(club_id, dauList, queryType);
		}
	},
	queryDAUFailed: function (code) {
		cc.log("queryDAUFailed", code)
	}

});