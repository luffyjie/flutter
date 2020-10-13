import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoLayout/app/discover/discover_page.dart';
import 'package:flutter_autoLayout/app/home/home_page.dart';
import 'package:flutter_autoLayout/app/launch/launch_page.dart';
import 'package:flutter_autoLayout/app/tab/tab_navigator.dart';
import 'package:flutter_autoLayout/app/user/uer_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabNavigator();
});

var launchRoutehandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LaunchPage();
});

var tabRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabNavigator();
});

var homeRoutehandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var discoverRoutehandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DiscoverPage();
});

var userRoutehandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return UserPage();
});

var settingRoutehandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LaunchPage();
});
