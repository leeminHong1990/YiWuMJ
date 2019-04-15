"use strict";
var switches = function () {
};

if (targetPlatform === cc.PLATFORM_OS_ANDROID) {

}
else if ((targetPlatform === cc.PLATFORM_OS_IPHONE) || (targetPlatform === cc.PLATFORM_OS_IPAD)) {

}
else {

}
switches.show_version = true;
switches.TEST_OPTION = true;

switches.share_android_url = "http://share_android_url";
switches.share_ios_url = "http://share_ios_url";
switches.h5entrylink = "http://h5entrylink";
switches.pay_mode = 0; // 0 在线 1 公众号 2 ios

switches.PHP_SERVER_URL = "http://10.0.0.4:9981/api/user_info";

switches.package_name = "com/a/b";

switches.customerService_wx = "xuanheywmj"

switches.kbeServerIP = "192.168.1.11";
switches.kbeServerLoginPort = 20013;