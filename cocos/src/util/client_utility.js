"use strict";
var cutil = function () {
}

cutil.lock_ui = function () {
    if (h1global.globalUIMgr) {
        h1global.globalUIMgr.lock_ui.show();
    }
};

cutil.unlock_ui = function () {
    if (h1global.globalUIMgr) {
        h1global.globalUIMgr.lock_ui.hide();
    }
};

cutil.deepCopy = function (obj) {
    var str, newobj = obj.constructor === Array ? [] : {};
    if (typeof obj !== 'object') {
        return;
    } else if (window.JSON) {
        str = JSON.stringify(obj), //系列化对象
            newobj = JSON.parse(str); //还原
    } else {
        for (var i in obj) {
            newobj[i] = typeof obj[i] === 'object' ?
                cutil.deepCopy(obj[i]) : obj[i];
        }
    }
    return newobj;
};

cutil.batch_replace = function (array, val, repVal) {
    for (var i = 0; i < array.length; i++) {
        if (array[i] == val) {
            array[i] = repVal
        }
    }
};

cutil.batch_delete = function (array, val) {
    for (var i = array.length - 1; i >= 0; i--) {
        if (array[i] == val) {
            array.splice(i, 1)
        }
    }
};

cutil.angle = function (a, b) { // 平面坐标系 b点到a点的角度 0-360
    let angel = Math.atan((b.y - a.y) / (b.x - a.x)) * 180 / Math.PI
    if (b.x - a.x >= 0 && b.y - a.y >= 0) { // 第一象限
        return angel
    } else if (b.x - a.x < 0 && b.y - a.y >= 0) { // 第二象限
        return 180 + angel
    } else if (b.x - a.x <= 0 && b.y - a.y <= 0) { // 第三象限
        return 180 + angel
    } else {
        return 360 + angel
    }
};

cutil.distance = function (a_point, b_point) {
    var y_distance = b_point.y - a_point.y;
    var x_distance = b_point.x - a_point.x;
    return Math.sqrt(Math.pow(x_distance, 2) + Math.pow(y_distance, 2))
};

cutil.isPositiveNumber = function (text) {
    if (text == undefined) return false;
    if (cc.isNumber(text)) {
        return text % 1 === 0;
    }
    return /^[1-9]\d*$/.test(text);
};

cutil.arrayShuffle = function (arr) {
    for (var j, x, i = arr.length; i; j = parseInt(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x) ;
    return arr;
};

cutil.arrayMax = function (arr) {
    if (arr && arr.length > 0) {
        var max = null;
        for (var i = 0; i < arr.length; i++) {
            var cur = arr[i];
            if (max === null || cur > max) {
                max = cur;
            }
        }
        return max;
    }
};

//字典的值转换为数组
cutil.dictValuesToArray = function (dict) {
    var arr = [];
    for (var values in dict) {
        arr.push(dict[values]);
    }
    return arr;
};

cutil.convert_time_to_date = function (rtime) {
    var temp = os.date("*t", rtime)
    return temp.year.toString() + "年" + temp.month.toString() + "月" + temp.day.toString() + "日"
};

cutil.convert_time_to_hour2second = function (rtime) {
    var temp = os.date("*t", rtime)
    return temp.hour.toString() + ":" + temp.min.toString()
};

cutil.convert_time_to_stime = function (ttime) {
    var temp = os.date("*t", ttime)
    return temp.year.toString() + "/" + temp.month.toString() + "/" + temp.day.toString() + "  " + temp.hour.toString() + ":" + temp.min.toString() + ":" + temp.sec.toString()
};

cutil.convert_timestamp_to_datetime = function (ts) {
    var date = new Date(ts * 1000);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).substr(-2);
    var day = ('0' + date.getDate()).substr(-2);
    var hour = ('0' + date.getHours()).substr(-2);
    var min = ('0' + date.getMinutes()).substr(-2);
    var sec = ('0' + date.getSeconds()).substr(-2);

    var time_str = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec;
    return time_str;
};

cutil.convert_timestamp_to_datetime_exsec = function (ts) {
    var date = new Date(ts * 1000);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).substr(-2);
    var day = ('0' + date.getDate()).substr(-2);
    var hour = ('0' + date.getHours()).substr(-2);
    var min = ('0' + date.getMinutes()).substr(-2);
    var sec = ('0' + date.getSeconds()).substr(-2);

    var time_str = year + '-' + month + '-' + day + '   ' + hour + ':' + min;
    return time_str;
};

cutil.convert_timestamp_to_ymd = function (ts) {
    var date    = new Date(ts * 1000);
    var year    = date.getFullYear();
    var month   = ('0' + (date.getMonth() + 1)).substr(-2);
    var day     = ('0' + date.getDate()).substr(-2);

    var time_str = year + '-' + month + '-' + day;
    return time_str;
};

cutil.convert_seconds_to_decimal = function (seconds, decimalNum) {
    seconds = String(seconds)
    var lis = [[], []]
    var index = 0
    for (var i = 0; i < seconds.length; i++) {
        if (seconds[i] === '.') {
            index += 1
        }
        if (index <= 1 && seconds[i] !== '.') {
            lis[index].push(seconds[i])
        }
    }
    if (lis[0].length <= 0) {
        return null;
    }
    var integerPart = ""
    for (var i = 0; i < lis[0].length; i++) {
        integerPart += lis[0][i];
    }
    var decimalPart = ""
    if (lis[1].length < decimalNum) {
        for (var i = 0; i < lis[1].length; i++) {
            decimalPart += lis[1][i];
        }
        for (var i = 0; i < decimalNum - lis[1].length; i++) {
            decimalPart += '0';
        }
    } else {
        for (var i = 0; i < decimalNum; i++) {
            decimalPart += lis[1][i];
        }
    }
    return integerPart + "." + decimalPart
}

cutil.convert_second_to_hms = function (sec) {
    if (!sec || sec <= 0) {
        return "00:00:00";
    }
    sec = Math.floor(sec);
    var hour = Math.floor(sec / 3600);
    var minute = Math.floor((sec % 3600) / 60);
    var second = (sec % 3600) % 60;
    // cc.log(second)

    var timeStr = "";
    if (hour < 10) {
        timeStr = timeStr + "0" + hour + ":";
    } else {
        timeStr = hour + ":";
    }
    if (minute < 10) {
        timeStr = timeStr + "0" + minute + ":";
    } else {
        timeStr = timeStr + minute + ":";
    }
    if (second < 10) {
        timeStr = timeStr + "0" + second;
    } else {
        timeStr = timeStr + second;
    }
    return timeStr;
}

cutil.convert_second_to_ms = function (sec) {
    if (!sec || sec <= 0) {
        return "00:00";
    }
    sec = Math.floor(sec);

    var minute = Math.floor(sec / 60);
    var second = sec % 60;
    // cc.log(second)

    var timeStr = "";
    if (minute < 10) {
        timeStr = timeStr + "0" + minute + ":";
    } else {
        timeStr = timeStr + minute + ":";
    }
    if (second < 10) {
        timeStr = timeStr + "0" + second;
    } else {
        timeStr = timeStr + second;
    }
    return timeStr;
}


cutil.resize_img = function (item_img, size) {
    var rect = item_img.getContentSize()
    var scale = size / rect.height
    var width = rect.width * scale
    if (width > size)
        scale = size / rect.width
    item_img.setScale(scale)
};

cutil.show_portrait_by_num = function (portrait_img, characterNum) {
    if (characterNum <= 100) {
        portrait_img.loadTexture("res/portrait/zhujue" + characterNum + ".png")
    }
    else {
        // var table_mercenary = require("data/table_mercenary")
        var mercenary_info = table_mercenary[characterNum]
        KBEngine.DEBUG_MSG("mercenary_info", mercenary_info["PORTRAIT"])
        portrait_img.loadTexture("res/portrait/" + mercenary_info["PORTRAIT"] + ".png")
    }
};


cutil.print_table = function (lst) {
    if (lst === undefined) {
        KBEngine.DEBUG_MSG("ERROR------>Table is undefined")
        return;
    }
    for (var key in lst) {
        var info = lst[key];
        KBEngine.DEBUG_MSG(key + " : " + info)
        if (info instanceof Array) {
            cutil.print_table(info);
        }
    }
};

cutil.is_in_list = function (x, t) {
    for (var index in t) {
        if (t[index] === x) {
            return index;
        }
    }
    return null;
}


cutil.str_sub = function (strinput, len) {
    if (strinput.length < len)
        return strinput
    if (strinput.length >= 128 && strinput.length < 192)
        return cutil.str_sub(strinput, len - 1)
    return strinput.substring(0, len)
};

cutil.info_sub = function (strinput, len, ellipsis) {
    ellipsis = ellipsis || "...";
    var output = cutil.str_sub(strinput, len)
    if (output.length < strinput.length) {
        return output + ellipsis
    }
    return output
};

cutil.share_lack_str = function (curGameRoom) {
    var lackStr = "";
    if (curGameRoom && curGameRoom.playerInfoList) {
        var num = 0;
        for (var i = 0; i < curGameRoom.playerInfoList.length; i++) {
            if (curGameRoom.playerInfoList[i]) {
                num++;
            }
        }
        if (num < curGameRoom.player_num) {
            lackStr = cc.formatStr(' %d等%d,', num, curGameRoom.player_num - num);
        }
    }
    return lackStr;
};

cutil.share_func = function (title, desc) {
    wx.onMenuShareAppMessage({
        title: title, // 分享标题
        desc: desc, // 分享描述
        link: switches.h5entrylink, // 分享链接
        imgUrl: '', // 分享图标
        type: '', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function () {
            // 用户确认分享后执行的回调函数
            cc.log("ShareAppMessage Success!");
        },
        cancel: function () {
            // 用户取消分享后执行的回调函数
            cc.log("ShareAppMessage Cancel!");
        },
        fail: function () {
            cc.log("ShareAppMessage Fail")
        },
    });
    wx.onMenuShareTimeline({
        title: title, // 分享标题
        desc: desc, // 分享描述
        link: switches.h5entrylink, // 分享链接
        imgUrl: '', // 分享图标
        type: '', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function () {
            // 用户确认分享后执行的回调函数
            cc.log("onMenuShareTimeline Success!");
        },
        cancel: function () {
            // 用户取消分享后执行的回调函数
            cc.log("onMenuShareTimeline Cancel!");
        },
        fail: function () {
            cc.log("onMenuShareTimeline Fail")
        },
    });
};

/*
cutil.deep_copy_table = 
	function (tb)
		if type(tb) ~= "table" then return tb end
		var result = {}
		for i, j in pairs(tb) do
			result[i] = cutil.deep_copy_table(j)
		end
		return result
	end
*/
cutil.convert_num_to_chstr = function (num) {
    if (typeof num !== "number") {
        // 处理UINT64
        num = num.toDouble();
    }

    function convert(num, limit, word) {
        var integer = Math.floor(num / limit);
        var res_str = integer.toString();
        var floatNum = 0;
        if (integer < 10) {
            // floatNum = (Math.floor((num % limit) / (limit / 100))) * 0.01;
            floatNum = (Math.floor((num % limit) / (limit / 100)));
            if (floatNum < 1) {
            } else if (floatNum < 10) {
                res_str = res_str + ".0" + floatNum.toString();
            } else {
                res_str = res_str + "." + floatNum.toString();
            }
        }
        else if (integer < 100) {
            floatNum = (Math.floor((num % limit) / (limit / 10)));
            if (floatNum < 1) {
            } else {
                res_str = res_str + "." + floatNum.toString();
            }
        }
        // floatNum = Math.floor(floatNum * limit)/limit
        // integer += floatNum;

        // return integer.toString() + word;
        // cc.log(num)
        // cc.log(res_str + word)
        return res_str + word;
    }

    if (num >= 1000000000) {
        return convert(num, 1000000000, "B");
    }
    else if (num >= 1000000) {
        return convert(num, 1000000, "M");
    }
    else if (num >= 1000) {
        return convert(num, 1000, "K");
    }
    else {
        return Math.floor(num).toString();
    }

};

cutil.splite_list = function (list, interval, fix_length) {
    var result_list = [];
    for (var i = 0; i < list.length; ++i) {
        var idx = Math.floor(i / interval);
        if (idx >= result_list.length) {
            result_list[idx] = [];
        }
        result_list[idx][i - idx * interval] = list[i];
    }

    if (fix_length && result_list.length < fix_length) {
        for (var i = result_list.length; i < fix_length; ++i) {
            result_list.push([]);
        }
    }
    return result_list;
};


cutil.get_rotation_angle = function (vec2) {
    var vec2_tan = Math.abs(vec2.y) / Math.abs(vec2.x);
    var angle = 0
    if (vec2.y == 0) {
        if (vec2.x > 0) {
            angle = 90
        }
        else if (vec2.x < 0) {
            angle = 270
        }
    }
    else if (vec2.x == 0) {
        if (vec2.y > 0) {
            angle = 0
        }
        else if (vec2.y < 0) {
            angle = 180
        }
    }
    else if (vec2.y > 0 && vec2.x < 0) {
        angle = Math.atan(vec2_tan) * 180 / Math.pi - 90;
    }
    else if (vec2.y > 0 && vec2.x > 0) {
        angle = 90 - Math.atan(vec2_tan) * 180 / Math.pi
    }
    else if (vec2.y < 0 && vec2.x < 0) {
        angle = -Math.atan(vec2_tan) * 180 / Math.pi - 90;
    }
    else if (vec2.y < 0 && vec2.x > 0) {
        angle = Math.atan(vec2_tan) * 180 / Math.pi + 90;
    }
    return angle
};

cutil.post_php_info = function (info, msg) {
    var xhr = new cc.XMLHttpRequest()
    xhr.responseType = 0 // cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr.open("GET", "http://" + serverconfig.httpServerIP + "/log_client.php?key=" + info + "&value=" + msg)

    function onReadyStateChange() {

    }

    xhr.registerScriptHandler(onReadyStateChange)
    xhr.send()
};


cutil.post_php_feedback = function (info, msg) {
    var xhr = new cc.XMLHttpRequest()
    xhr.responseType = 0 // cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr.open("GET", "http://" + serverconfig.httpServerIP + "/log_feedback.php?key=" + info + "&value=" + msg)

    function onReadyStateChange() {
    }

    xhr.registerScriptHandler(onReadyStateChange)
    xhr.send()
};


cutil.printMessageToLogcat = function (message) {
    if (targetPlatform === cc.PLATFORM_OS_ANDROID) {
        //var ok,ret  = luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "sPrintMsg", { message }, "(Ljava/lang/String;)V")
    }
};

cutil.openWebURL = function (url) {
    if (targetPlatform == cc.PLATFORM_OS_ANDROID) {
        //var ok,ret  = luaj.callStaticMethod("org/cocos2dx/lua/AppActivity", "sOpenWebURL", { url }, "(Ljava/lang/String;)V")
    }

};

cutil.get_uint32 = function (inputNum) {
    return Math.ceil(inputNum) % 4294967294
};

cutil.schedule = function (node, callback, delay) {
    // var delayAction = cc.DelayTime.create(delay);
    // var sequence = cc.Sequence.create(delay, cc.CallFunc.create(callback));
    // var action = cc.RepeatForever.create(sequence);
    // node.runAction(action);
    var action = cc.RepeatForever.create(cc.Sequence.create(cc.DelayTime.create(delay), cc.CallFunc.create(callback)));
    node.runAction(action);
    return action;
};

cutil.performWithDelay = function (node, callback, delay) {
    var delayAction = cc.DelayTime.create(delay);
    var sequence = cc.Sequence.create(delay, cc.CallFunc.create(callback));
    node.runAction(sequence);
    return sequence;
};

cutil.binarySearch = function (targetList, val, func) {
    func = func || function (x, val) {
        return val - x;
    };
    var curIndex = 0;
    var fromIndex = 0;
    var toIndex = targetList.length - 1;
    while (toIndex > fromIndex) {
        curIndex = Math.floor((fromIndex + toIndex) / 2);
        if (func(targetList[curIndex], val) < 0) {
            toIndex = curIndex;
        } else if (func(targetList[curIndex], val) > 0) {
            fromIndex = curIndex + 1;
        } else if (func(targetList[curIndex], val) === 0) {
            return curIndex + 1;
        }
    }
    return toIndex;
};

cutil.get_count = function (tiles, t) {
    var sum = 0;
    for (var i = 0; i < tiles.length; i++) {
        if (tiles[i] === t) {
            sum++;
        }
    }
    return sum;
};

cutil.meld_history = {};

cutil.meld_with_pair_need_num = function (tiles, history, used) {
    history = history || this.meld_history;
    var case1 = 999;
    var case2 = 999;
    var idx = -1;

    if (cutil.meld_only_need_num(tiles, history) === 0) {
        case1 = 2;
    }

    for (var i = 0; i < tiles.length; i++) {
        var tmp = tiles.concat([]);

        if (cutil.get_count(tiles, tiles[i]) === 1) {
            idx = tmp.indexOf(tiles[i]);
            tmp.splice(idx, 1);
            case2 = Math.min(case2, 1 + cutil.meld_only_need_num(tmp, history));
        } else {
            idx = tmp.indexOf(tiles[i]);
            tmp.splice(idx, 1);
            idx = tmp.indexOf(tiles[i]);
            tmp.splice(idx, 1);
            case2 = Math.min(case2, cutil.meld_only_need_num(tmp, history));
        }
    }

    return Math.min(case1, case2);
};

cutil.meld_only_need_num = function (tiles, history, used) {
    history = history || this.meld_history;
    used = used || 0;
    if (used > 4) {
        return 999;
    }

    var key = tiles.concat([]).sort(function (a, b) {
        return a - b;
    });
    if (history.hasOwnProperty(key)) {
        return history[key];
    }

    var size = tiles.length;
    if (size == 0) {
        return 0;
    }
    if (size == 1) {
        return 2;
    }
    if (size == 2) {
        var p1 = tiles[0];
        var p2 = tiles[1];
        var case1 = 999;
        if (p1 < const_val.BOUNDARY && p2 - p1 <= 2) {
            case1 = 1;
        }
        case2 = 0;
        if (p1 == p2) {
            case2 = 1;
        } else {
            case2 = 4
        }
        return Math.min(case1, case2);
    }

    var first = tiles[0];
    // 自己组成顺子
    var case1 = 0;
    var left1 = tiles.slice();
    left1.shift();
    // console.log("left1 = ", left1);
    if (first >= const_val.BOUNDARY) {
        case1 = 999
    } else {
        var idx1 = left1.indexOf(first + 1);
        if (idx1 >= 0) {
            left1.splice(idx1, 1);
        } else {
            case1 += 1;
        }
        var idx2 = left1.indexOf(first + 2);
        if (idx2 >= 0) {
            left1.splice(idx2, 1);
        } else {
            case1 += 1;
        }
        var res1 = this.meld_only_need_num(left1, history, used);
        history[left1] = res1;
        case1 += res1
    }


    // 自己组成刻子
    var case2 = 0;
    var left2 = tiles.slice();
    left2.shift();
    var count = this.get_count(left2, first);
    if (count >= 2) {
        var idx = left2.indexOf(first);
        left2.splice(idx, 1);
        idx = left2.indexOf(first);
        left2.splice(idx, 1);
    } else if (count == 1) {
        var idx = left2.indexOf(first);
        left2.splice(idx, 1);
        case2 += 1;
    } else {
        case2 += 2;
    }
    var res2 = this.meld_only_need_num(left2, history, used);
    history[left2] = res2;
    case2 += res2;
    var result = Math.min(case1, case2);
    history[tiles] = result;
    return result;
};

// 判断能否听牌, 如果不能, 就不用检查哪些能够胡牌了.
// 这个问题可以等价为: 给你一张癞子牌, 你能否胡牌.
cutil.canTenPai = function (handTiles, kingTiles) {
    kingTiles = kingTiles || [];
    if (handTiles.length % 3 !== 1) {
        return false;
    }

    var classifyList = this.classifyTiles(handTiles, kingTiles);
    var kingTilesNum = classifyList[0].length;
    var handTilesButKing = [];
    for (var i = 1; i < classifyList.length; i++) {
        handTilesButKing = handTilesButKing.concat(classifyList[i])
    }

    // 先处理特殊情况
    // 7对胡
    if (cutil.is7DoubleWin(handTiles, handTilesButKing, kingTilesNum + 1)) {
        return true;
    }

    var num = this.meld_with_pair_need_num(handTilesButKing);
    return (num - kingTilesNum <= 1);
};

// Attention: 正常的胡牌(3N, 有赖子牌), 七对胡那种需要特殊判断, 这里不处理
cutil.canNormalWinWithKing3N = function (handTilesButKing, kingTilesNum) {
    if ((handTilesButKing.length + kingTilesNum) % 3 !== 0) {
        return false;
    }
    var classified = cutil.classifyTiles(handTilesButKing, []);
    var chars = classified[1];
    var bambs = classified[2];
    var dots = classified[3];
    var winds = classified[4];
    var dragons = classified[5];
    var class_list = [chars, bambs, dots, winds, dragons];
    var mos = 0, i, mo;
    for (i = 0; i < class_list.length; i++) {
        var tiles = class_list[i];
        mo = cutil.meld_only_need_num(tiles);
        mos += mo;
    }
    return mos <= kingTilesNum;
};

// Attention: 正常的胡牌(3N + 2, 有赖子牌), 七对胡那种需要特殊判断, 这里不处理
cutil.canNormalWinWithKing3N2 = function (handTilesButKing, kingTilesNum) {
    if ((handTilesButKing.length + kingTilesNum) % 3 !== 2) {
        return false;
    }
    var classified = cutil.classifyTiles(handTilesButKing, []);
    var chars = classified[1];
    var bambs = classified[2];
    var dots = classified[3];
    var winds = classified[4];
    var dragons = classified[5];
    var class_list = [chars, bambs, dots, winds, dragons];
    var meldNeed = [];
    var mos = 0, mps = 0, i, mo, mp;
    for (i = 0; i < class_list.length; i++) {
        var tiles = class_list[i];
        mo = cutil.meld_only_need_num(tiles);
        mp = cutil.meld_with_pair_need_num(tiles);
        mos += mo;
        mps += mp;
        meldNeed.push([mo, mp]);
    }

    for (i = 0; i < meldNeed.length; i++) {
        mo = meldNeed[i][0];
        mp = meldNeed[i][1];
        if (mp + (mos - mo) <= kingTilesNum) {
            return true;
        }
    }
    return false;
};


// Attention: 正常的的胡牌(3N + 2, 没有赖子), 七对胡那种需要特殊判断, 这里不处理
cutil.canNormalWinWithoutKing3N2 = function (handTiles) {
    if (handTiles.length % 3 !== 2) {
        return false;
    }
    var classified = cutil.classifyTiles(handTiles);
    var chars = classified[1];
    var bambs = classified[2];
    var dots = classified[3];
    var winds = classified[4];
    var dragons = classified[5];
    var hasPair = false;
    var i, n;
    // 先把东西南北中发财拿出来单独处理
    for (i = 0; i < const_val.WINDS.length; i++) {
        var w = const_val.WINDS[i];
        n = this.get_count(winds, w);
        switch (n) {
            case 1:
                return false;
            case 2:
                if (hasPair) return false;
                hasPair = true;
                break;
        }
    }

    for (i = 0; i < const_val.DRAGONS.length; i++) {
        var d = const_val.DRAGONS[i];
        n = this.get_count(dragons, d);
        switch (n) {
            case 1:
                return false;
            case 2:
                if (hasPair) return false;
                hasPair = true;
                break;
        }
    }

    // 判断万, 条, 筒这些
    var tiles = [];
    tiles = tiles.concat(chars);
    tiles = tiles.concat(bambs);
    tiles = tiles.concat(dots);

    if (hasPair) {
        return cutil.isMeld(tiles);
    } else {
        return cutil.isMeldWithPair(tiles);
    }
};

cutil.isMeld = function (tiles) {
    if (tiles.length % 3 !== 0) {
        return false;
    }
    var tilesCopy = tiles.concat([]);
    var total = 0;
    for (var i = 0; i < tilesCopy.length; i++) {
        total += tilesCopy[i];
    }
    var magic = total % 3;
    var idx1 = -1;
    var idx2 = -1;
    if (magic === 0) {
        tilesCopy.sort(function (a, b) {
            return a - b;
        });
        while (tilesCopy.length >= 3) {
            var left = tilesCopy[0];
            var n = this.get_count(tilesCopy, left);
            tilesCopy.shift();
            switch (n) {
                case 1:
                    // 移除一个顺子
                    idx1 = tilesCopy.indexOf(left + 1);
                    if (idx1 >= 0) {
                        tilesCopy.splice(idx1, 1);
                    } else {
                        return false;
                    }
                    idx2 = tilesCopy.indexOf(left + 2);
                    if (idx2 >= 0) {
                        tilesCopy.splice(idx2, 1);
                    } else {
                        return false;
                    }
                    break;
                case 2:
                    // 移除两个顺子
                    tilesCopy.shift();
                    if (this.get_count(tilesCopy, left + 1) >= 2) {
                        idx1 = tilesCopy.indexOf(left + 1);
                        tilesCopy.splice(idx1, 2);
                    } else {
                        return false;
                    }
                    if (this.get_count(tilesCopy, left + 2) >= 2) {
                        idx2 = tilesCopy.indexOf(left + 2);
                        tilesCopy.splice(idx2, 2);
                    } else {
                        return false;
                    }
                    break;
                default:
                    // 移除一个刻子
                    tilesCopy.shift();
                    tilesCopy.shift();
                    break;
            }
        }
    }
    return tilesCopy.length === 0;
};


cutil.isMeldWithPair = function (tiles) {
    if (tiles.length % 3 !== 2) {
        return false;
    }
    var total = 0;
    for (var i = 0; i < tiles.length; i++) {
        total += tiles[i];
    }
    var magic = total % 3;
    var possible;
    switch (magic) {
        case 0:
            possible = [3, 6, 9, 33, 36, 39, 51, 54, 57];
            return this.checkMeldInPossible(tiles, possible);
        case 1:
            possible = [2, 5, 8, 32, 35, 38, 53, 56, 59];
            return this.checkMeldInPossible(tiles, possible);
        case 2:
            possible = [1, 4, 7, 31, 34, 37, 52, 55, 58];
            return this.checkMeldInPossible(tiles, possible);
    }
    return false;
};

cutil.checkMeldInPossible = function (tiles, possibleList) {
    var idx;
    for (var i = 0; i < possibleList.length; i++) {
        var p = possibleList[i];
        if (this.get_count(tiles, p) >= 2) {
            var tmp = tiles.concat([]);
            idx = tmp.indexOf(p);
            tmp.splice(idx, 2);
            if (this.isMeld(tmp)) {
                return true;
            }
        }
    }
    return false;
};


// 用于调用本地时，保存回调方法的闭包
cutil.callFuncs = {};
cutil.callFuncMax = 10000;
cutil.callFuncIdx = -1;
cutil.addFunc = function (callback) {
    cutil.callFuncIdx = (cutil.callFuncIdx + 1) % cutil.callFuncMax;
    cutil.callFuncs[cutil.callFuncIdx] = callback;
    return cutil.callFuncIdx;
};
cutil.runFunc = function (idx, param) {
    if (cutil.callFuncs[idx]) {
        (cutil.callFuncs[idx])(param);
        cutil.callFuncs[idx] = undefined;
    }
};

cutil.portraitCache = {};

cutil.loadURLTexture = function (url, callback) {
	if(cutil.portraitCache[url]){
		callback(cutil.portraitCache[url]);
		return;
	}
	var filename = encodeURIComponent(url) + ".png";
	var fid = cutil.addFunc(function(img){cutil.portraitCache[url] = img;callback(img);});
	if((cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative)){
		jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "downloadAndStoreFile", "(Ljava/lang/String;Ljava/lang/String;I)V", url, filename, fid);
	} else if((cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative)){
		jsb.reflection.callStaticMethod("DownloaderOCBridge", "downloadAndStorePortrait:WithLocalFileName:AndFuncId:", url, filename, fid);
	} else {
		cc.loader.loadImg([url], {"isCrossOrigin":false}, function(err, img){cutil.runFunc(fid, img);});
	}
};

cutil.loadPortraitTexture = function(url, sex, callback){
	cc.log("loadPortraitTexture:", url);
	if (!url || !(url.indexOf("http") === 0 || url.indexOf("https") === 0)) {
		if(sex === 1){
			callback && callback("res/ui/Default/male.png");
		}else {
			callback && callback("res/ui/Default/famale.png");
		}
		return;
	}
	cutil.loadURLTexture(url, function (img) {
		if(img){
			callback && callback(img);
		}else{
			if(sex === 1){
				callback && callback("res/ui/Default/male.png");
			}else {
				callback && callback("res/ui/Default/famale.png");
			}
		}
	})
};

cutil.captureScreenCallback = function (success, filepath) {
    // 安卓截屏回调
    if ((cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) && success) {
        if (filepath.substring(filepath.length - 7, filepath.length) == "_MJ.png") {
            jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "saveScreenShot", "(Ljava/lang/String;)V", filepath);
        }
        else {
            jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "callWechatShareImg", "(ZLjava/lang/String;)V", true, filepath);
        }
    }
};

cutil.sortChowTileList = function (chowTile, tiles) {
    var tempTiles = tiles.concat();
    var endTile = tempTiles.pop();
    tempTiles.splice(0, 1);
    return [tempTiles[0], chowTile, endTile];
};

cutil.tileSort = function (tiles, kingTiles) {
    var kings = kingTiles || [];
    tiles.sort(function (a, b) {
        if (kings.indexOf(a) >= 0 && kings.indexOf(b) >= 0) {
            return a - b;
        } else if (kings.indexOf(a) >= 0) {
            return -1
        } else if (kings.indexOf(b) >= 0) {
            return 1
        } else if (kingTiles.length > 0 && a === const_val.DRAGON_WHITE && b === const_val.DRAGON_WHITE) {
            return 0
        } else if (kingTiles.length > 0 && a === const_val.DRAGON_WHITE) {
            return kings[0] - b;
        } else if (kingTiles.length > 0 && b === const_val.DRAGON_WHITE) {
            return a - kings[0];
        } else {
            return a - b;
        }
    })
};

cutil.classifyTiles = function (tiles, kingTiles) {
    kingTiles = kingTiles || [];
    var kings = [];
    var chars = [];
    var bambs = [];
    var dots = [];
    var winds = [];
    var dragons = [];

    tiles = cutil.deepCopy(tiles)
    tiles.sort(function (a, b) {
        return a - b;
    })

    for (var i = 0; i < tiles.length; i++) {
        var t = tiles[i]
        if (kingTiles.indexOf(t) >= 0) {
            kings = kings.concat(t)
        } else if (const_val.CHARACTER.indexOf(t) >= 0) {
            chars = chars.concat(t)
        } else if (const_val.BAMBOO.indexOf(t) >= 0) {
            bambs = bambs.concat(t)
        } else if (const_val.DOT.indexOf(t) >= 0) {
            dots = dots.concat(t)
        } else if (const_val.WINDS.indexOf(t) >= 0) {
            winds = winds.concat(t)
        } else if (const_val.DRAGONS.indexOf(t) >= 0) {
            dragons = dragons.concat(t)
        } else {
            cc.log("iRoomRules classify tiles failed, no this tile " + t.toString());
        }
    }
    return [kings, chars, bambs, dots, winds, dragons]
};

cutil.classifyWindTiles = function (tiles, kingTiles) {
    kingTiles = kingTiles || [];
    var kings = [];
    var hangTiles = [];

    tiles = cutil.deepCopy(tiles)
    tiles.sort(function (a, b) {
        return a - b;
    });

    for (var i = 0; i < tiles.length; i++) {
        var t = tiles[i]
        if (kingTiles.indexOf(t) >= 0) {
            kings = kings.concat(t)
        } else if (const_val.CHARACTER.indexOf(t) >= 0) {
            hangTiles = hangTiles.concat(t)
        } else if (const_val.BAMBOO.indexOf(t) >= 0) {
            hangTiles = hangTiles.concat(t)
        } else if (const_val.DOT.indexOf(t) >= 0) {
            hangTiles = hangTiles.concat(t)
        } else if (const_val.WINDS.indexOf(t) >= 0) {
            hangTiles = hangTiles.concat(t)
        } else if (const_val.DRAGONS.indexOf(t) >= 0) {
            hangTiles = hangTiles.concat(t)
        } else {
            cc.log("iRoomRules classify tiles failed, no this tile " + t.toString());
        }
    }
    return [kings, hangTiles]
}

cutil.classifyTiles4Type = function (tiles) {

    var chars = [];
    var bambs = [];
    var dots = [];
    var winds_dragons = [];

    tiles = cutil.deepCopy(tiles)
    tiles.sort(function (a, b) {
        return a - b;
    })

    for (var i = 0; i < tiles.length; i++) {
        var t = tiles[i]
        if (const_val.CHARACTER.indexOf(t) >= 0) {
            chars = chars.concat(t)
        } else if (const_val.BAMBOO.indexOf(t) >= 0) {
            bambs = bambs.concat(t)
        } else if (const_val.DOT.indexOf(t) >= 0) {
            dots = dots.concat(t)
        } else if (const_val.WINDS.indexOf(t) >= 0 || const_val.DRAGONS.indexOf(t) >= 0) {
            winds_dragons = winds_dragons.concat(t)
        } else {
            cc.log("classifyTiles4Type tiles failed, no this tile " + t.toString());
        }
    }
    return [chars, bambs, dots, winds_dragons]
}

//获取同样牌的张数 dict
cutil.getTileNumDict = function (tiles) {
    var tileDict = {}
    for (var i = 0; i < tiles.length; i++) {
        var t = tiles[i]
        if (!tileDict[t]) {
            tileDict[t] = 1
        } else {
            tileDict[t] += 1
        }
    }
    return tileDict
}

// 对子数(不考虑牌的替换功能)
cutil.getPairsNum = function (tiles, isContainTriple, isContainKong) { //是否包含一组中的对子 是否包含杠中的对子
    isContainTriple = isContainTriple || false;
    isContainKong = isContainKong || false;
    var num = 0;
    var tileDict = cutil.getTileNumDict(tiles)
    for (var tile in tileDict) {
        if (tileDict[tile] == 2 || (tileDict[tile] == 3 && isContainTriple)) {
            num += 1;
        }
        if (tileDict[tile] == 4 && isContainKong) {
            num += 2;
        }
    }
    return num;
}

//除对子之外的牌 (不考虑牌的替换功能)
cutil.getExCeptPairsList = function (tiles, isContainTriple, isContainKong) {
    isContainTriple = isContainTriple || false;
    isContainKong = isContainKong || false;
    var list = []
    var tileDict = cutil.getTileNumDict(tiles)
    for (var tile in tileDict) {
        if (tileDict[tile] == 1) {
            list.push(tile)
        }
        if (tileDict[tile] == 3) {
            if (isContainTriple) {
                list.push(tile)
            } else {
                list.concat([tile, tile, tile])
            }
        }
        if (tileDict[tile] == 4 && !isContainKong) {
            list.concat([tile, tile, tile, tile])
        }
    }
    return list
}

// 刻子数，若包含杠 杠只计算一次(不考虑牌的替换功能)
cutil.getTripletNum = function (tiles, isContainKong) { //是否包含杠中的刻子
    isContainKong = isContainKong || false;
    var num = 0;
    var tileDict = cutil.getTileNumDict(tiles)
    for (var tile in tileDict) {
        if (tileDict[tile] == 3) {
            num += 1;
        }
        if (tileDict[tile] == 4 && isContainKong) {
            num += 1;
        }
    }
    return num;
}

//杠子数(不考虑牌的替换功能)
cutil.getKongNum = function (tiles) {
    var num = 0;
    var tileDict = cutil.getTileNumDict(tiles)
    for (var tile in tileDict) {
        if (tileDict[tile] == 4) {
            num += 1;
        }
    }
    return num;
}

//财神数量
cutil.getKingTileNum = function (tiles, kingTile) {
    var num = 0
    for (var i = 0; i < tiles.length; i++) {
        if (tiles[i] == kingTile) {
            num += 1
        }
    }
    return num
}

// //最大顺子数(不考虑牌的替换功能)
// cutil.getMaxSequenceNum = function(tiles){
// 	var num = 0
//  tiles = cutil.deepCopy(tiles)
// 	tiles.sort(function(a, b){return a-b;})
// 	for (var i = 0; i < tiles.length; i++) {
// 		if (!tiles[i+2]) {break;}
// 		if (tiles[i] >= 31) {break;}
// 		if (tiles[i] + 1 == tiles[i+1] && tiles[i+1] + 1 == tiles[i+2]) {
// 			num += 1;
// 			i += 2
// 		}
// 	}
// 	return num
// }

cutil.getTileNum = function (tiles, aimTile) {
    var tileDict = cutil.getTileNumDict(tiles)
    if (aimTile in tileDict) {
        return tileDict[aimTile]
    }
    return 0
}

cutil.checkIs7Pairs = function (handTilesButKing, kingTilesNum, kingTiles, finalTile) {
    if (handTilesButKing.length + kingTilesNum !== 14) {
        return [false, false];
    }
    var tileDict = cutil.getTileNumDict(handTilesButKing);
    var need_num = 0;
    var meld_list = [];
    for (var tile in tileDict) {
        var tmp = [];
        for (var i = 0; i < tileDict[tile]; i++) {
            tmp.push(parseInt(tile));
        }
        meld_list.push(tmp);
    }
    for (var i = 0; i < meld_list.length; i++) {
        if (meld_list[i].length % 2 !== 0) {
            meld_list[i].push(-1);
            need_num += 1;
        }
    }
    if (need_num <= kingTilesNum) {
        var isBaoTou = false;
        if (kingTilesNum > 0) {
            if (kingTiles.indexOf(finalTile) >= 0) {
                isBaoTou = kingTilesNum - need_num >= 2;
            } else {
                for (var i = 0; i < meld_list.length; i++) {
                    var meld = meld_list[i];
                    if (meld.indexOf(finalTile) >= 0 && meld.indexOf(-1) >= 0) {
                        return [true, true];
                    }
                }
                isBaoTou = kingTilesNum - need_num >= 2;
            }
        }
        return [true, isBaoTou]
    }
    return [false, false]
};

//打出的牌的张数 ，用来判断天胡 地胡
cutil.getDiscardNum = function (discardTilesList, upTilesOpsList, cutIdxsList, seatNum) {
    var num = 0
    //被其他玩家吃碰杠的牌 是否 是 东南西北中发白
    for (var i = 0; i < upTilesOpsList.length; i++) {
        if (i == seatNum) {
            continue;
        }
        for (var j = 0; j < upTilesOpsList[i].length; j++) {
            var op_r = upTilesOpsList[i][j]
            if (op_r[2] == seatNum) {
                num += 1;
            }
        }
    }
    // 自己打出的牌
    num += discardTilesList[seatNum].length - cutIdxsList[seatNum].length
    return num
}

//胡 —— 大吊车 
cutil.checkCanWinSingle = function (handTiles, kingTile, finalDrawTile) {
    if (handTiles.length != 2 || finalDrawTile == kingTile) {
        return false;
    }
    var kingTileNum = cutil.getKingTileNum(handTiles, kingTile)
    if (kingTileNum > 0) {
        return true;
    } else if (handTiles[0] == handTiles[1]) {
        return true;
    }
    return false;
}


//是否清一色（不判断是否能胡）
cutil.checkIsFlush = function (handTiles, upTiles, kingTile) {
    var allTiles = handTiles.concat(upTiles)

    var flushList = [const_val.CHARACTER, const_val.BAMBOO, const_val.DOT]
    var index = -1
    for (var i = 0; i < allTiles.length; i++) {
        var tile = allTiles[i]
        if ((const_val.DRAGONS.indexOf(tile) >= 0 || const_val.WINDS.indexOf(tile) >= 0) && tile != kingTile) {
            return false
        }
        //查找 清一色类型索引
        if (tile != kingTile && index < 0) {
            for (var j = 0; j < flushList.length; j++) {
                if (flushList[j].indexOf(tile) >= 0) {
                    index = j
                    break
                }
            }
        }
        //不是财神 看索引，核对是否同一类型
        if (tile != kingTile) {
            if (index < 0) {
                return false;
            }
            if (flushList[index].indexOf(tile) < 0) {
                return false
            }
        }
    }
    return true
}

//是否是大对子(碰碰胡)（不判断是否能胡）// 全部是碰子或杠子 // 白板 在不考虑顺子的情况下 也可以无视
cutil.checkIsBigPair = function (handListButKing, upTiles, kingTilesNum) {
    //桌牌,按连续索引(连续的碰杠才算，1,2,3, 1,2,3, 1,2,3 不算)
    cc.log("大对子检查")
    cc.log(handListButKing, upTiles, kingTilesNum)
    if (kingTilesNum >= 2) {
        return false
    }
    for (var i = 0; i < upTiles.length; i++) {
        if (upTiles[i + 2] && upTiles[i] != upTiles[i + 1] && upTiles[i + 1] != upTiles[i + 2]) {
            return false
        }
    }
    var tile2NumDict = cutil.getTileNumDict(handListButKing)
    var numList = [0, 0, 0, 0]
    for (var tile in tile2NumDict) {
        var num = tile2NumDict[tile]
        numList[num - 1] += 1
    }
    if (kingTilesNum == 1) {
        if (numList[0] != 1 || numList[1] > 0) {
            return false
        }
    } else {
        if (numList[0] > 0 || numList[1] != 1) {
            return false
        }
    }
    return true
}

//倒数开始 连续扔出财神的张数
cutil.getDiscardSerialKingTileNum = function (handTiles, discardTilesList, cutIdxsList, kingTile, seatNum) {
    var num = 0
    if (handTiles.indexOf(kingTile) < 0) {
        return num
    }
    for (var i = discardTilesList[seatNum].length - 1; i >= 0; i--) {
        if (cutIdxsList[seatNum].indexOf(i) >= 0) {
            continue;
        }
        if (discardTilesList[seatNum][i] != kingTile) {
            break;
        }
        num += 1;
    }
    return num
}
/**
 * @param  {玩家所有吃碰杠操作列表}
 * @param  {打牌列表}
 * @param  {切牌索引}
 * @return {玩家座次}
 */
cutil.getNearlyKongType = function (upTilesOpsList, discardTilesList, cutIdxsList, seatNum) {
    cc.log("getNearlyKongType", upTilesOpsList, discardTilesList, cutIdxsList, seatNum)
    // 0 不是杠 1 明杠 2 暗杠
    var discardLen = discardTilesList[seatNum].length
    if (cutIdxsList[seatNum].indexOf(discardLen - 1) < 0) {
        return 0
    }
    var op_r = upTilesOpsList[seatNum][upTilesOpsList[seatNum].length - 1]
    if (op_r.length < 2) {
        if (op_r[0]["opId"] == const_val.OP_EXPOSED_KONG) {
            return 1
        }
        if (op_r[0]["opId"] == const_val.OP_CONCEALED_KONG) {
            return 2
        }
        if (op_r[0]["opId"] == const_val.OP_KONG_WREATH) {
            return 3
        }
    }
    if (op_r.length >= 2) {
        return 1
    }
    return 0
}

cutil.removeSequence = function (tiles, kingTileNum) {
    var newTiles = cutil.deepCopy(tiles)
    newTiles.sort(function (a, b) {
        return a - b;
    })
    for (var i = 0; i < newTiles.length; i++) {
        var t = newTiles[i]
        if (newTiles[i + 1] && newTiles[i + 2] && newTiles[i] + 1 == newTiles[i + 1] && newTiles[i + 1] + 1 == newTiles[i + 2]) { //不缺
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 3, newTiles.length))
            return [newList, kingTileNum, true]
        } else if (newTiles[i + 1] && (newTiles[i] + 1 == newTiles[i + 1] || newTiles[i] + 2 == newTiles[i + 1]) && kingTileNum >= 1) { //缺1
            kingTileNum -= 1
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 2, newTiles.length))
            return [newList, kingTileNum, true]
        } else if (kingTileNum >= 2) { //缺2
            kingTileNum -= 2
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 1, newTiles.length))
            return [newList, kingTileNum, true]
        }
    }
    return [newTiles, kingTileNum, false]
}

cutil.removeTriple = function (tiles, kingTileNum) {
    var newTiles = cutil.deepCopy(tiles)
    newTiles.sort(function (a, b) {
        return a - b;
    })

    for (var i = 0; i < newTiles.length; i++) {
        var t = newTiles[i]
        if (newTiles[i + 1] && newTiles[i + 2] && newTiles[i] == newTiles[i + 1] && newTiles[i + 1] == newTiles[i + 2]) {
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 3, newTiles.length))
            return [newList, kingTileNum, true]
        } else if (newTiles[i + 1] && newTiles[i] == newTiles[i + 1] && kingTileNum >= 1) { //缺1
            kingTileNum -= 1
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 2, newTiles.length))
            return [newList, kingTileNum, true]
        } else if (kingTileNum >= 2) {	//缺2
            kingTileNum -= 2
            var newList = newTiles.slice(0, i).concat(newTiles.slice(i + 1, newTiles.length))
            return [newList, kingTileNum, true]
        }
    }
    return [newTiles, kingTileNum, false]
}

cutil.check_wind_dragon = function (listWindDragon, kingTilesNum) {
    var result = cutil.removeTriple(listWindDragon, kingTilesNum)
    kingTilesNum = result[1]
    if (result[2]) {
        result = cutil.check_wind_dragon(result[0], kingTilesNum)
    }
    return result
}

// 循环check 是否满足 顺子，同三张，杠 - 334 ()
/**
 * @param  {手牌删除对子后的牌，白板已经替换了财神的所有情况}
 * @param  {删除对子后的 财神数，该财神可以随便替}
 * @return {bool}
 */
cutil.loop2Win = function (delPairList, kingTilesNum) {
    cc.log("||")
    cc.log("VV")
    cc.log("进入查询手牌是否是3x阶段")
    if (delPairList.length <= 0) {
        if (kingTilesNum <= 0) {	//删除一对后手上没有牌
            cc.log("删除一对后手上没有牌")
            return true
        }
        cc.log("删除一对后手上只剩财神 不能胡")
        return false	//删除一对后手上只剩财神 不能胡
    }
    var classifyList = cutil.classifyTiles4Type(delPairList)

    var listExceptWindDragon = classifyList[0].concat(classifyList[1].concat(classifyList[2]))
    var listWindDragon = classifyList[3]

    var result = cutil.check_wind_dragon(listWindDragon, kingTilesNum)
    var windDragonPairNum = cutil.getPairsNum(result[0])
    kingTilesNum = result[1]

    if (result[0].length * 2 - windDragonPairNum * 3 > kingTilesNum) {
        cc.log("东南西北中发白 字牌不满足条件 无法胡，缺张数：", result[0].length * 2 - windDragonPairNum * 3 - kingTilesNum)
        return false
    }
    cc.log("东南西北中发白 字牌满足条件,现在财神数量:", kingTilesNum)
    var needNum = cutil.meld_only_need_num(listExceptWindDragon, {})
    if (needNum > kingTilesNum) {
        cc.log("万, 条, 筒不满足,无法胡，缺张数：", needNum, "财神数:", kingTilesNum)
        return false
    }
    cc.log("万, 条, 筒满足,可以胡。缺", needNum, "财神数:", kingTilesNum)
    return true
}

cutil.get_user_info = function (accountName, callback) {
    var info_dict = eval('(' + cc.sys.localStorage.getItem("INFO_JSON") + ')');
    var user_info_xhr = cc.loader.getXMLHttpRequest();
    user_info_xhr.open("GET", switches.PHP_SERVER_URL + "/api/user_info", true);
    user_info_xhr.onreadystatechange = function () {
        if (user_info_xhr.readyState === 4 && user_info_xhr.status === 200) {
            // cc.log(user_info_xhr.responseText);
            if (callback) {
                callback(user_info_xhr.responseText);
            }
        }
    };
    user_info_xhr.setRequestHeader("Authorization", "Bearer " + info_dict["token"]);
    user_info_xhr.send();
};

cutil.count = function (list, key) {
    var dict = {}
    for (var i = 0; i < list.length; i++) {
        if (dict[list[i]]) {
            dict[list[i]] += 1;
        } else {
            dict[list[i]] = 1;
        }
    }
    if (dict[key]) {
        return dict[key]
    }
    return 0
};

cutil.getTileColorType = function (handTilesButKing, upTiles) {
    // cc.log("getTileColorType : ",handTilesButKing ,upTiles)
    var suitNumList = [0, 0, 0];
    var honorNum = 0;
    for (var i = 0; i < handTilesButKing.length; i++) {
        var t = handTilesButKing[i]
        if (const_val.CHARACTER.indexOf(t) >= 0) {
            suitNumList[0] = 1
        } else if (const_val.BAMBOO.indexOf(t) >= 0) {
            suitNumList[1] = 1
        } else if (const_val.DOT.indexOf(t) >= 0) {
            suitNumList[2] = 1
        } else if (const_val.DRAGONS.indexOf(t) >= 0 || const_val.WINDS.indexOf(t) >= 0) {
            honorNum = 1
        }
    }

    // cc.log("  " + suitNumList[0] + "  " + suitNumList[1] + "  " + suitNumList[2] +  "  "+  honorNum);
    for (var i = 0; i < upTiles.length; i++) {
        var meld = upTiles[i]
        for (var j = 0; j < meld.length; j++) {
            var t = meld[j]
            if (const_val.CHARACTER.indexOf(t) >= 0) {
                suitNumList[0] = 1
            } else if (const_val.BAMBOO.indexOf(t) >= 0) {
                suitNumList[1] = 1
            } else if (const_val.DOT.indexOf(t) >= 0) {
                suitNumList[2] = 1
            } else if (const_val.DRAGONS.indexOf(t) >= 0 || const_val.WINDS.indexOf(t) >= 0) {
                honorNum = 1
            }
        }
    }

    // cc.log("  " + suitNumList[0] + "  " + suitNumList[1] + "  " + suitNumList[2] +  "  "+  honorNum);
    var suitNum = suitNumList[0] + suitNumList[1] + suitNumList[2]
    if (suitNum > 1) {
        return const_val.MIX_X_SUIT
    } else if (suitNum == 1) {
        if (honorNum == 1) {
            return const_val.MIXED_ONE_SUIT
        } else {
            return const_val.SAME_SUIT
        }
    } else {
        if (honorNum == 1) {
            return const_val.SAME_HONOR
        } else {
            return const_val.MIX_X_SUIT
        }
    }
};

cutil.checkIsPongPongWin = function (handTilesButKing, upTiles, kingTilesNum) {
    for (var i = 0; i < upTiles.length; i++) {
        var meld = upTiles[i]
        if ((meld.length != 3 && meld.length != 4) || meld[0] != meld[2]) {
            return false
        }
    }
    var tiles = handTilesButKing.concat([])
    var tile2NumDict = cutil.getTileNumDict(tiles)
    var isRemovePair = false
    for (var t in tile2NumDict) {
        if (tile2NumDict[t] == 2) {
            delete tile2NumDict[t]
            isRemovePair = true
            break
        }
    }
    if (!isRemovePair) {
        for (var t in tile2NumDict) {
            if (tile2NumDict[t] == 1) {
                delete tile2NumDict[t]
                kingTilesNum -= 1
                isRemovePair = true
                break
            }
        }
    }
    if (!isRemovePair) {
        for (var t in tile2NumDict) {
            if (tile2NumDict[t] == 4) {
                delete tile2NumDict[t]
                kingTilesNum -= 1
                isRemovePair = true
                break
            }
        }
    }
    if (!isRemovePair) {
        for (var t in tile2NumDict) {
            if (tile2NumDict[t] == 3) {
                tile2NumDict[t] = 1
                isRemovePair = true
                break
            }
        }
    }
    for (var t in tile2NumDict) {
        kingTilesNum -= Math.abs(3 - tile2NumDict[t])
    }
    if (!isRemovePair || kingTilesNum < 0) {
        return false
    }
    return true
};

cutil.checkIsDiscard = function (op_record) {
    for (var i = op_record.length - 1; i >= 0; i--) {
        if (op_record[i][0] == const_val.OP_DISCARD) {
            return true
        }
    }
    return false
};

cutil.checkIsKongDrawWin = function (p_op_r) {
    for (var i = p_op_r.length - 1; i >= 0; i--) {
        if (p_op_r[i][0] == const_val.OP_DRAW || p_op_r[i][0] == const_val.OP_CUT) {
            continue
        }
        if (p_op_r[i][0] == const_val.OP_CONCEALED_KONG) {
            return true
        } else if (p_op_r[i][0] == const_val.OP_EXPOSED_KONG) {
            return true
        } else if (p_op_r[i][0] == const_val.OP_CONTINUE_KONG) {
            return true;
        } else if (p_op_r[i][0] == const_val.OP_KONG_WREATH) {
            return true
        }
        return false
    }
    return false
};

// 十三不靠
cutil.get13Mismatch = function (handTiles, kingTiles) {
    if (handTiles.length !== 14) {
        return false;
    }
    let classifyTiles = cutil.classifyTiles(handTiles, kingTiles);
    let kings = classifyTiles[0];
    let chars = classifyTiles[1];
    let bambs = classifyTiles[2];
    let dots = classifyTiles[3];
    let winds = classifyTiles[4];
    let dragons = classifyTiles[5];
    let winds_dragons = winds.concat(dragons);
    for (var i = 1; i < 4; i++) {
        if (classifyTiles[i].length > 3) {
            return false
        }
    }
    if (winds_dragons.length > 7) {
        return false
    }
    let kingTileNum = kings.length;
    if (kingTileNum > 2) {
        return false;
    }
    let need_tiles_num = 5 - winds_dragons.length;
    if (need_tiles_num > kingTileNum) {
        return false;
    }
    let char_dict = cutil.getTileNumDict(chars);
    let bamb_dict = cutil.getTileNumDict(bambs);
    let dot_dict = cutil.getTileNumDict(dots);
    let wind_dragon_dict = cutil.getTileNumDict(winds_dragons);

    var tmp_char_dict = cutil.dictValuesToArray(char_dict);
    var tmp_bamb_dict = cutil.dictValuesToArray(bamb_dict);
    var tmp_dot_dict = cutil.dictValuesToArray(dot_dict);
    var tmp_wind_dragon_dict = cutil.dictValuesToArray(wind_dragon_dict);
    if ((tmp_char_dict.length > 0 && cutil.arrayMax(tmp_char_dict) > 1) ||
        (tmp_bamb_dict.length > 0 && cutil.arrayMax(tmp_bamb_dict) > 1) ||
        (tmp_dot_dict.length > 0 && cutil.arrayMax(tmp_dot_dict) > 1) ||
        (tmp_wind_dragon_dict.length > 0 && cutil.arrayMax(tmp_wind_dragon_dict) > 1)) {
        return false;
    }

    function check_is_match(arr) {
        let len = arr.length;
        if (len <= 1) {
            return true;
        }
        if (len === 2) {
            return arr[1] - arr[0] >= 3
        }
        if (len === 3) {
            return arr[1] - arr[0] >= 3 && arr[2] - arr[1] >= 3;
        }
        return false
    }

    if (!check_is_match(chars) || !check_is_match(bambs) || !check_is_match(dots)) {
        return false;
    }
    var flags = [false, false, false];

    function tryFill(arr) {
        let len = arr.length;
        let need = 3 - len;
        if (len > 0) {
            let tmp = parseInt(arr[0] / 10);
            var index = -1;
            if (tmp === 0) {
                index = 0;
            } else if (tmp === 3) {
                index = 1;
            } else if (tmp === 5) {
                index = 2;
            } else {
                return -1;
            }
            if (flags[index]) {
                return -1;
            } else {
                flags[index] = true;
                return need;
            }
        }
    }

    let tile_group = [chars, bambs, dots];
    for (var i = 0; i < 3; i++) {
        if (tile_group[i].length === 0) {
            need_tiles_num += 3;
        } else {
            let need = tryFill(tile_group[i]);
            if (need < 0) {
                return false;
            }
            need_tiles_num += need;
        }
    }
    return need_tiles_num === kingTileNum;
};

// 十三幺
cutil.getThirteenOrphans = function (handTilesButKing, kingTilesNum) {
    if (handTilesButKing.length + kingTilesNum !== 14) {
        return false;
    }
    let need_tiles = [1, 9, 31, 39, 51, 59, 71, 72, 73, 74, 75, 76, 77];

    function withoutKings() {
        for (var t of need_tiles) {
            if (handTilesButKing.indexOf(t) < 0) {
                return false;
            }
        }
        for (var i = 0; i < need_tiles.length; i++) {
            if (cutil.get_count(handTilesButKing, need_tiles[i]) === 2) {
                return true;
            }
        }
        return false;
    }

    if (kingTilesNum > 0) {
        let copyHand = handTilesButKing.slice(0);
        let win_need_tile = [];
        for (var i = 0; i < need_tiles.length; i++) {
            var tile = need_tiles[i];
            let index = copyHand.indexOf(tile);
            if (index >= 0) {
                copyHand.splice(index, 1);
            } else {
                win_need_tile.push(tile);
            }
        }

        if (copyHand.length > 1) {
            return false;
        }

        if (copyHand.length === 1 && need_tiles.indexOf(copyHand[0]) < 0) {
            return false;
        }
        let need_sum = win_need_tile.length;
        need_sum += copyHand.length === 0 ? 1 : 0;
        return need_sum === kingTilesNum;
    } else {
        return withoutKings();
    }
};

cutil.postDataFormat = function (obj) {
    if (typeof obj != "object") {
        alert("输入的参数必须是对象");
        return;
    }

    // 支持有FormData的浏览器（Firefox 4+ , Safari 5+, Chrome和Android 3+版的Webkit）
    if (typeof FormData == "function") {
        var data = new FormData();
        for (var attr in obj) {
            data.append(attr, obj[attr]);
        }
        return data;
    } else {
        // 不支持FormData的浏览器的处理
        var arr = new Array();
        var i = 0;
        for (var attr in obj) {
            arr[i] = encodeURIComponent(attr) + "=" + encodeURIComponent(obj[attr]);
            i++;
        }
        return arr.join("&");
    }
};

cutil.spread_bind = function (invite_id, callback) {
    var info_dict = eval('(' + cc.sys.localStorage.getItem("INFO_JSON") + ')');
    var bind_xhr = cc.loader.getXMLHttpRequest();
    bind_xhr.open("POST", switches.PHP_SERVER_URL + "/api/spread/bind", true);
    bind_xhr.onreadystatechange = function () {
        if (bind_xhr.readyState === 4 && bind_xhr.status === 200) {
            // cc.log(bind_xhr.responseText);
            if (callback) {
                callback(bind_xhr.responseText);
            }
        }
    };
    bind_xhr.setRequestHeader("Authorization", "Bearer " + info_dict["token"]);
    bind_xhr.send(cutil.postDataFormat({"invite_id": invite_id}));
};

// pay
cutil.appendUrlParam = function (url, arr) {
	if (!arr || arr.length === 0 || arr.length % 2 !== 0) {
		cc.warn("url params error! ", arr);
		return url;
	}
	if (url.indexOf('?') === -1) {
		url += '?';
	}
	for (var i = 0; i < arr.length; i += 2) {
		url += encodeURIComponent(arr[i]) + "=" + encodeURIComponent(arr[i + 1]);
		if (i !== arr.length - 2) {
			url += '&';
		}
	}
	return url;
};

cutil.get_pay_url = function(goods_id){
	var info_dict = eval('(' + cc.sys.localStorage.getItem("INFO_JSON") + ')');
	var bind_xhr = cc.loader.getXMLHttpRequest();
	bind_xhr.open("GET", cutil.appendUrlParam(switches.PHP_SERVER_URL + "/zhangling/order_info", ['good_id', goods_id]), true);
	bind_xhr.onreadystatechange = function(){
		cutil.unlock_ui();
		if(bind_xhr.readyState === 4 && bind_xhr.status === 200){
			// cc.log(bind_xhr.responseText);
			if(bind_xhr.responseText[0] == "{") {
				var pay_url_dict = JSON.parse(bind_xhr.responseText);
				if (pay_url_dict["errcode"] == 0) {
					cutil.open_url(cutil.appendUrlParam(switches.PHP_SERVER_URL + "/zhangling/jump_wx", ['orderInfo', pay_url_dict["data"]]))
				} else {
					cc.log("Get Pay Url Error! The Error Code is " + pay_url_dict["errcode"].toString() + "!");
					h1global.globalUIMgr.info_ui.show_by_info("无效的支付链接！", cc.size(300, 200));
				}
			} else {
				cc.log("The Pay Url is Illegall!");
				h1global.globalUIMgr.info_ui.show_by_info("无效的支付链接！", cc.size(300, 200));
			}
		}
	};
	bind_xhr.setRequestHeader("Authorization", "Bearer " + info_dict["token"]);
	bind_xhr.send();
};

// 3X+2 卡张
cutil.isReadyMeldPairForOne = function (handTilesButKing, finalTile, kingTiles, kingTilesNum) {
    if (handTilesButKing.indexOf(finalTile) < 0 || kingTiles.indexOf(finalTile) >= 0) {
        return false
    }
    var copyHandTilesButKing = handTilesButKing.concat([])
    copyHandTilesButKing.splice(handTilesButKing.indexOf(finalTile), 1)
    var tryTiles = [const_val.CHARACTER, const_val.BAMBOO, const_val.DOT, const_val.WINDS, const_val.DRAGONS]
    var readyList = []
    for (var i = 0; i < tryTiles.length; i++) {
        for (var j = 0; j < tryTiles[i].length; j++) {
            // if (kingTiles.indexOf(tryTiles[i][j]) >= 0) {continue;} //不计算财神(财神归位)
            var tryList = copyHandTilesButKing.concat([tryTiles[i][j]])
            if (cutil.meld_with_pair_need_num(tryList, {}) <= kingTilesNum) {
                readyList.push(tryTiles[i][j])
            }
        }
    }
    return readyList.length == 1 ? true : false;
};


// 语音相关 -- start
cutil.start_record = function (filename, fid) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        jsb.reflection.callStaticMethod(switches.package_name + "/gvoice/GVoiceJavaBridge", "startRecording", "(Ljava/lang/String;I)V", filename, fid);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        jsb.reflection.callStaticMethod("GVoiceOcBridge", "startRecording:withFuncID:", filename, fid);
    }
    else {
        cc.log("not native, start_record pass");
    }
};

cutil.stop_record = function () {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        jsb.reflection.callStaticMethod(switches.package_name + "/gvoice/GVoiceJavaBridge", "stopRecording", "()V");
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        jsb.reflection.callStaticMethod("GVoiceOcBridge", "stopRecording");
    }
    else {
        cc.log("not native, stop_record pass");
    }
};

cutil.download_voice = function (fileID) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        jsb.reflection.callStaticMethod(switches.package_name + "/gvoice/GVoiceJavaBridge", "downloadVoice", "(Ljava/lang/String;)V", fileID);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        jsb.reflection.callStaticMethod("GVoiceOcBridge", "downloadVoiceWithID:", fileID);
    }
    else {
        cc.log("not native, download_voice pass");
    }
};
// 语音相关 -- end

// 定位相关 -- start
cutil.start_location = function () {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "startLocation", "()V");
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        jsb.reflection.callStaticMethod("AMapOCBridge", "startLocation");
    }
    else {
        cc.log("not native, start_location pass");
    }
};
cutil.get_location_geo = function () {
    // G_LOCATION_GEO
    return cc.sys.localStorage.getItem("G_LOCATION_GEO");
};

cutil.get_location_lat = function () {
    // G_LOCATION_LAT
    return cc.sys.localStorage.getItem("G_LOCATION_LAT");
};

cutil.get_location_lng = function () {
    // G_LOCATION_LNG
    return cc.sys.localStorage.getItem("G_LOCATION_LNG");
};
cutil.calc_distance = function (lat1, lng1, lat2, lng2) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod(switches.package_name + "/util/UtilJavaBridge", "calcDistance", "(FFFF)F", lat1, lng1, lat2, lng2);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod("UtilOcBridge", "calcDistanceFromLat:Lng:ToLat:Lng:", lat1, lng1, lat2, lng2);
    }
    else {
        cc.log("not native, calc_distance pass");
    }
};

cutil.open_url = function (url) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "openURL", "(Ljava/lang/String;)V", url);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        jsb.reflection.callStaticMethod("UtilOcBridge", "openURL:", url);
    }
    else {
        cc.log("not native, open_url pass");
    }
};

cutil.get_playing_room_detail = function (room_info) {
    var str_list = [];

    if (room_info['round_mode'] === const_val.NORMAL_ROUND_MODE) {
        str_list.push("打捆");
        str_list.push(room_info["score"] + "分");
    } else {
        str_list.push("长跑");
        str_list.push(room_info["maxRound"] + "局");
    }

    if (room_info["king_mode"] === const_val.KING_MODE_FIXED) {
        str_list.push("发财财神");
    } else {
        str_list.push("翻财神");
    }

    if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ZERO) {
        str_list.push("7个9个");
    } else {
        str_list.push("11个13个");
    }

    // if (room_info["job"] === const_val.MODE_NOT_JOB) {
    //     str_list.push("不承包");
    // } else {
    //     str_list.push("承包以及反承包");
    // }

    if (room_info['hand_prepare'] === const_val.AUTO_PREPARE) {
        str_list.push("自动准备");
    } else {
        str_list.push("手动准备");
    }

    return str_list.join(',');
};

cutil.get_agent_room_desc = function (room_info) {
    var str_list = [];

    if (room_info['round_mode'] === const_val.NORMAL_ROUND_MODE) {
        str_list.push("打捆");
        str_list.push(room_info["score"] + "分");
    } else {
        str_list.push("长跑");
        str_list.push(room_info["maxRound"] + "局");
    }

    if (room_info["king_mode"] === const_val.KING_MODE_FIXED) {
        str_list.push("发财财神");
    } else {
        str_list.push("翻财神");
    }

    if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ZERO) {
        str_list.push("7个9个");
    } else {
        str_list.push("11个13个");
    }

    // if (room_info["job"] === const_val.MODE_NOT_JOB) {
    //     str_list.push("不承包");
    // } else {
    //     str_list.push("承包以及反承包");
    // }

    if (room_info['hand_prepare'] === const_val.AUTO_PREPARE) {
        str_list.push("自动准备");
    } else {
        str_list.push("手动准备");
    }

    return str_list.join(',');
};

cutil.getOpenUrlIntentData = function (action) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "getOpenUrlIntentData", "(Ljava/lang/String;)Ljava/lang/String;", action);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod("UtilOcBridge", "getOpenUrlIntentData:", action);
    }
    else {
        cc.log('pass getOpenUrlIntentData');
    }
};

cutil.clearOpenUrlIntentData = function () {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "clearOpenUrlIntentData", "()V");
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod("UtilOcBridge", "clearOpenUrlIntentData");
    }
    else {
        cc.log('pass clearOpenUrlIntentData');
    }
};

cutil.callEnterRoom = function (roomId) {
    if (roomId == undefined) {
        let player = h1global.entityManager.player();
        if (player) {
            roomId = cutil.getOpenUrlIntentData("joinroom");
            if (!roomId || roomId.length === 0) {
                cc.warn('cutil.callEnterRoom error');
                return;
            }
        }
    }
    if (cutil.isPositiveNumber(roomId)) {
        let rid = parseInt(roomId);
        let scene = cc.director.getRunningScene();
        if (scene.className !== 'GameRoomScene') {
            let player = h1global.entityManager.player();
            if (player) {
                cutil.lock_ui();
                player.enterRoom(rid);
            }
        }
    }
};

cutil.clearEnterRoom = function () {
    cutil.clearOpenUrlIntentData();
};

cutil.registerGameShowEvent = function () {
    if (cc._event_show_func) {
        return;
    }
    cc._event_show_func = function () {
        cutil.callEnterRoom();
    };
    cc.eventManager.addCustomListener(cc.game.EVENT_INTENT, cc._event_show_func);
};

//复制到剪贴板
cutil.copyToClipBoard = function (content) {
    if (cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod(switchesnin1.package_name + "/AppActivity", "copyToClipBoard", "(Ljava/lang/String;)V", content);
    }
    else if (cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative) {
        return jsb.reflection.callStaticMethod("UtilOcBridge", "copyToClipBoard:", content);
    }
    else {
        cc.log("not native, copyToClipBoard pass");
    }
};

cutil.wechatTimelineCallback = function () {
    // 微信分享成功回调
    var info_dict = eval('(' + cc.sys.localStorage.getItem("INFO_JSON") + ')');
    var bind_xhr = cc.loader.getXMLHttpRequest();
    bind_xhr.open("POST", switchesnin1.PHP_SERVER_URL + "/api/share_award", true);
    bind_xhr.onreadystatechange = function () {
        if (bind_xhr.readyState === 4 && bind_xhr.status === 200) {
            if (h1global.curUIMgr.gamehall_ui && h1global.curUIMgr.gamehall_ui.is_show) {
                h1global.curUIMgr.gamehall_ui.updateCharacterCard();
            }
        }
    };
    bind_xhr.setRequestHeader("Authorization", "Bearer " + info_dict["token"]);
    bind_xhr.send();
    cc.sys.localStorage.setItem("LAST_TIMELINE_DATE", new Date().toLocaleDateString());
};

cutil.get_award = function (accountName, callback) {
    var info_dict = eval('(' + cc.sys.localStorage.getItem("INFO_JSON") + ')');
    var user_info_xhr = cc.loader.getXMLHttpRequest();
    user_info_xhr.open("POST", switches.PHP_SERVER_URL + "/api/spread/get_award", true);
    user_info_xhr.onreadystatechange = function () {
        if (user_info_xhr.readyState === 4 && user_info_xhr.status === 200) {
            // cc.log(user_info_xhr.responseText);
            if (callback) {
                callback(user_info_xhr.responseText);
            }
        }
    };
    user_info_xhr.setRequestHeader("Authorization", "Bearer " + info_dict["token"]);
    user_info_xhr.send();
};

cutil.convert_timestamp_to_mdhms = function (ts) {
    var date    = new Date(ts * 1000);
    var year    = date.getFullYear();
    var month   = ('0' + (date.getMonth() + 1)).substr(-2);
    var day     = ('0' + date.getDate()).substr(-2);
    var hour    = ('0' +date.getHours()).substr(-2);
    var min     = ('0' + date.getMinutes()).substr(-2);
    var sec     = ('0' + date.getSeconds()).substr(-2);

    return month + '-' + day + ' ' + hour + ':' + min + ':' + sec;
};


cutil.get_club_share_desc = function (room_info) {
    var str_list = [];

    if (room_info['round_mode'] === const_val.NORMAL_ROUND_MODE) {
        str_list.push("打捆");
    } else {
        str_list.push("长跑");
    }

    if(room_info['king_mode'] === const_val.KING_MODE_FIXED){
        str_list.push("发财财神");
    } else {
        str_list.push("翻财神");
    }

    if (const_val.ROUND.indexOf(room_info['game_round'])>= 0) {
        str_list.push(room_info['game_round'] + "局")
    }

    if (room_info['max_lose'] === const_val.DEFAULT_GAME_SCORE) {
        str_list.push("100分")
    }

    if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ZERO) {
        str_list.push("庄家9分,闲家7分")
    } else if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ONE) {
        str_list.push("庄家13分,闲家11分")
    }

    if (room_info["discard_seconds"] > 0) {
        str_list.push("出牌时限" + room_info["discard_seconds"] + "秒")
    }

    if (room_info["job"] === const_val.MODE_NOT_JOB) {
        str_list.push("不承包")
    } else {
        str_list.push("承包和反承包")
    }

    if (room_info["pay_mode"] === const_val.NORMAL_PAY_MODE) {
        str_list.push("房主支付")
    } else if(room_info["pay_mode"] === const_val.AA_PAY_MODE){
        str_list.push("AA支付")
    } else if(room_info["pay_mode"] === const_val.AGENT_PAY_MODE){
        str_list.push("代理支付")
    } else if(room_info["pay_mode"] === const_val.CLUB_PAY_MODE){
        str_list.push("老板支付")
    }

    if (room_info["hand_prepare"] === const_val.HAND_PREPARE) {
        str_list.push("手动准备")
    } else {
        str_list.push("自动准备")
    }

    return str_list.join(',');
};

cutil.get_complete_room_detail = function (room_info) {
    var str_list = [];

    if (room_info['round_mode'] === const_val.NORMAL_ROUND_MODE) {
        str_list.push("打捆");
    } else {
        str_list.push("长跑");
    }

    if(room_info['king_mode'] === const_val.KING_MODE_FIXED){
        str_list.push("发财财神");
    } else {
        str_list.push("翻财神");
    }

    if (const_val.ROUND.indexOf(room_info['game_round'])>= 0) {
        str_list.push(room_info['game_round'] + "局")
    }

    if (room_info['max_lose'] === const_val.DEFAULT_GAME_SCORE) {
        str_list.push("100分")
    }

    if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ZERO) {
        str_list.push("庄家9分,闲家7分")
    } else if (room_info["base_score_mode"] === const_val.BASE_SCORE_MODE_ONE) {
        str_list.push("庄家13分,闲家11分")
    }

    if (room_info["discard_seconds"] > 0) {
        str_list.push("出牌时限" + room_info["discard_seconds"] + "秒")
    }

    if (room_info["job"] === const_val.MODE_NOT_JOB) {
        str_list.push("不承包")
    } else {
        str_list.push("承包和反承包")
    }

    if (room_info["pay_mode"] === const_val.NORMAL_PAY_MODE) {
        str_list.push("房主支付")
    } else if(room_info["pay_mode"] === const_val.AA_PAY_MODE){
        str_list.push("AA支付")
    } else if(room_info["pay_mode"] === const_val.AGENT_PAY_MODE){
        str_list.push("代理支付")
    } else if(room_info["pay_mode"] === const_val.CLUB_PAY_MODE){
        str_list.push("老板支付")
    }

    if (room_info["hand_prepare"] === const_val.HAND_PREPARE) {
        str_list.push("手动准备")
    } else {
        str_list.push("自动准备")
    }

    return str_list.join(',');
};

//battery
cutil.getBattery = function () {
	if ((cc.sys.os == cc.sys.OS_ANDROID && cc.sys.isNative)) {
		return jsb.reflection.callStaticMethod(switches.package_name + "/AppActivity", "getBattery", "()I");
	} else if ((cc.sys.os == cc.sys.OS_IOS && cc.sys.isNative)) {
		return jsb.reflection.callStaticMethod("UtilOcBridge", "getBattery");
	} else {
		cc.warn("not support getBattery");
		return 50;
	}
};