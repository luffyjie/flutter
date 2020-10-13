import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = '/';
  static String launch = '/launch';
  static String tab = '/tab';
  static String home = "/tab/home";
  static String discover = '/tab/discover';
  static String user = '/tab/discover';
  static String setting = '/user/setting';

  static void configureRouters(fluro.Router router) {
    router.notFoundHandler = fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
    });
    router.define(root, handler: rootHandler);
    router.define(launch, handler: launchRoutehandler);
    router.define(tab, handler: tabRouteHandler);
    router.define(home, handler: homeRoutehandler);
    router.define(discover, handler: discoverRoutehandler);
    router.define(user, handler: userRoutehandler);
    router.define(setting, handler: settingRoutehandler);
  }
}
