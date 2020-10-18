import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle headlineText(CupertinoThemeData themeData) => TextStyle(
        color: themeData.textTheme.textStyle.color,
        fontFamily: 'NotoSans',
        fontSize: 32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );

  static const minorText = TextStyle(
    color: Color.fromRGBO(128, 128, 128, 1),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static TextStyle triviaFinishedTitleText(CupertinoThemeData themeData) =>
      TextStyle(
        color: themeData.textTheme.textStyle.color,
        fontFamily: 'NotoSans',
        fontSize: 32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  static const frostedBackground = Color(0xccf8f8f8);

  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );
}
