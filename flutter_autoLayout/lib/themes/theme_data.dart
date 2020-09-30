import 'package:flutter_autoLayout/public.dart';
import 'package:google_fonts/google_fonts.dart';

class AutolayoutThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        brightness: colorScheme.brightness,
        centerTitle: true,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      textTheme: _textTheme,
      primaryColor: colorScheme.primary,
      backgroundColor: Colors.white,
      canvasColor: colorScheme.background,
      toggleableActiveColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      indicatorColor: colorScheme.onPrimary,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF6200EE),
    primaryVariant: Color(0xFF6200EE),
    secondary: Color(0xFFFF5722),
    secondaryVariant: Color(0xFFFF5722),
    background: Colors.white,
    surface: Color(0xFFF2F2F2),
    onBackground: Colors.black,
    error: _lightFillColor,
    onError: _lightFillColor,
    onSurface: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;

  static final TextTheme _textTheme = TextTheme(
      button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14),
      subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
      bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0));
}
