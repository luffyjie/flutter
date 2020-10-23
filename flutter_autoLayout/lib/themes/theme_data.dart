import 'package:flutter_autolayout/public.dart';

class AppThemeData {
  static ThemeData themeData(
    ColorScheme colorScheme,
    Color primary,
    TargetPlatform platform,
    TextTheme textTheme,
  ) {
    return ThemeData(
      platform: platform,
      colorScheme: colorScheme.copyWith(primary: primary),
      textTheme: textTheme,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        textTheme: textTheme.apply(bodyColor: colorScheme.onSurface),
        color: colorScheme.secondary,
        iconTheme: IconThemeData(),
        elevation: 0,
        brightness: colorScheme.brightness,
        centerTitle: true,
      ),
      iconTheme: IconThemeData(color: colorScheme.primary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: colorScheme.onSurface,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
      ),
      backgroundColor: colorScheme.background,
      toggleableActiveColor: colorScheme.primary,
      indicatorColor: colorScheme.onPrimary,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
