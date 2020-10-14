import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autoLayout/route/not_found_page.dart';
import 'package:flutter_autoLayout/app/user/user_route.dart';
import 'package:flutter_autoLayout/app/discover/discover_page.dart';
import 'package:flutter_autoLayout/app/home/home_page.dart';
import 'package:flutter_autoLayout/app/launch/launch_page.dart';
import 'package:flutter_autoLayout/app/tab/tab_navigator.dart';

class Application {
  static fluro.Router router;

  static void push(BuildContext context, String path) {
    router.navigateTo(context, path);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}

abstract class RouterProtocol {
  void initRouter(fluro.Router router);
}

class Routes {
  static String root = '/';
  static String launch = '/launch';
  static String tab = '/tab';
  static String home = "/home";
  static String discover = '/discover';

  static void configureRouters(fluro.Router router) {
    router.notFoundHandler = fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('Not find page');
      return NotFoundPage();
    });

    router.define(root, handler: rootHandler);
    router.define(launch, handler: launchRoutehandler);
    router.define(tab, handler: tabRouteHandler);
    router.define(home, handler: homeRoutehandler);
    router.define(discover, handler: discoverRoutehandler);

    // module register
    UserRouter().initRouter(router);
  }
}

// Handler
var rootHandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabNavigator();
});

var launchRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LaunchPage();
});

var tabRouteHandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabNavigator();
});

var homeRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var discoverRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DiscoverPage();
});
