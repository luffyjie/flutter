import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autolayout/public.dart';
import 'package:flutter_autolayout/app/user/setting/setting_page.dart';
import 'package:flutter_autolayout/app/user/uer_page.dart';

class UserRouter implements RouterProtocol {
  static String user = 'user';
  static String setting = '/user/setting';

  @override
  void initRouter(fluro.Router router) {
    router.define(user, handler: userRoutehandler);
    router.define(setting, handler: settingRoutehandler);
  }
}

var userRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return UserPage();
});

var settingRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SettingPage();
});
