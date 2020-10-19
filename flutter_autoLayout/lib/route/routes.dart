import 'package:flutter_autolayout/app/message/message_page.dart';
import 'package:flutter_autolayout/app/user/uer_page.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autolayout/route/laon_route.dart';
import 'package:flutter_autolayout/route/user_route.dart';
import 'package:flutter_autolayout/app/discover/discover_page.dart';
import 'package:flutter_autolayout/app/home/home_page.dart';
import 'package:flutter_autolayout/app/launch/launch_page.dart';
import 'package:flutter_autolayout/app/tab/tab_navigator.dart';
import 'package:flutter_autolayout/layout/not_found_page.dart';

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
  static String tab = '/';
  static String launch = '/launch';
  static String home = "/home";
  static String discover = '/discover';
  static String me = '/me';
  static String message = '/message';

  static void configureRouters(fluro.Router router) {
    router.notFoundHandler = fluro.Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      debugPrint('Not find page');
      return NotFoundPage();
    });

    router.define(launch, handler: launchRoutehandler);
    router.define(tab, handler: tabRouteHandler);
    router.define(home, handler: homeRoutehandler);
    router.define(message, handler: messsageRoutehandler);
    router.define(discover, handler: discoverRoutehandler);
    router.define(me, handler: meRoutehandler);

    // module register
    UserRouter().initRouter(router);
    LoanRouter().initRouter(router);
  }
}

var launchRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LaunchPage();
});

var tabRouteHandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return TabNavigator();
});

var homeRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return HomePage();
});

var messsageRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MessagePage();
});

var discoverRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return DiscoverPage();
});

var meRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return UserPage();
});
