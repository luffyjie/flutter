import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle headlineText(CupertinoThemeData themeData) => TextStyle(
        color: themeData.textTheme.textStyle.color,
        fontFamily: 'NotoSans',
        fontSize: 32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );

  static const sectionBackground = Color(0xFFF6F7FA);

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme textTheme = TextTheme(
    headline4: TextStyle(fontWeight: _bold, fontSize: 20.0),
    caption: TextStyle(fontWeight: _semiBold, fontSize: 16.0),
    headline5: TextStyle(fontWeight: _medium, fontSize: 16.0),
    subtitle1: TextStyle(fontWeight: _medium, fontSize: 16.0),
    overline: TextStyle(fontWeight: _medium, fontSize: 12.0),
    bodyText1: TextStyle(fontWeight: _regular, fontSize: 14.0),
    subtitle2: TextStyle(fontWeight: _medium, fontSize: 14.0),
    bodyText2: TextStyle(fontWeight: _regular, fontSize: 16.0),
    headline6: TextStyle(fontWeight: _bold, fontSize: 16.0),
    button: TextStyle(fontWeight: _semiBold, fontSize: 14.0),
  );

  static final TextTheme kuaileTextTheme = TextTheme(
    headline4:
        TextStyle(fontFamily: 'kuaile', fontWeight: _bold, fontSize: 20.0),
    caption:
        TextStyle(fontFamily: 'kuaile', fontWeight: _semiBold, fontSize: 16.0),
    headline5:
        TextStyle(fontFamily: 'kuaile', fontWeight: _medium, fontSize: 16.0),
    subtitle1:
        TextStyle(fontFamily: 'kuaile', fontWeight: _medium, fontSize: 16.0),
    overline:
        TextStyle(fontFamily: 'kuaile', fontWeight: _medium, fontSize: 12.0),
    bodyText1:
        TextStyle(fontFamily: 'kuaile', fontWeight: _regular, fontSize: 14.0),
    subtitle2:
        TextStyle(fontFamily: 'kuaile', fontWeight: _medium, fontSize: 14.0),
    bodyText2:
        TextStyle(fontFamily: 'kuaile', fontWeight: _regular, fontSize: 16.0),
    headline6:
        TextStyle(fontFamily: 'kuaile', fontWeight: _bold, fontSize: 16.0),
    button:
        TextStyle(fontFamily: 'kuaile', fontWeight: _semiBold, fontSize: 14.0),
  );

  static final TextTheme googleTextTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );

  static final ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF0090EA),
    primaryVariant: Color(0xFF00A0E9),
    secondary: Color(0xFFEDEDED),
    secondaryVariant: Color(0xFFE4E4E5),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onBackground: Color(0xFF666666),
    onSecondary: Color(0xFF999999),
    onSurface: Color(0xFF232323),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFBB86FC),
    primaryVariant: Color(0xFF3700B3),
    secondary: Color(0xFF03DAC6),
    secondaryVariant: Color(0xFF03DAC6),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    error: Color(0xFFCF6679),
    onPrimary: Color(0xFF000000),
    onSecondary: Color(0xFF000000),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFF000000),
    brightness: Brightness.dark,
  );
}
