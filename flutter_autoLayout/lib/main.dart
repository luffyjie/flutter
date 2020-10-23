import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/services.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:flutter_autolayout/route/routes.dart';
import 'package:flutter_autolayout/themes/theme_data.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(App());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    final router = fluro.Router();
    Routes.configureRouters(router);
    Application.router = router;
  }

  @override
  Widget build(Object context) {
    return OKToast(
      child: ModelBinding(
        initialModel: ApplicationOptions(
          themeMode: ThemeMode.system,
          textScaleFactor: systemTextScaleFactorOption,
          customtextDirection: CustomtextDirection.localeBased,
          locale: null,
          timeDilation: timeDilation,
          platform: defaultTargetPlatform,
          textTheme: Styles.textTheme,
          themeColor: Colors.orange,
        ),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: "autolayout",
              debugShowCheckedModeBanner: false,
              themeMode: ApplicationOptions.of(context).themeMode,
              theme: AppThemeData.themeData(
                Styles.lightColorScheme,
                ApplicationOptions.of(context).themeColor,
                ApplicationOptions.of(context).platform,
                ApplicationOptions.of(context).textTheme,
              ),
              darkTheme: AppThemeData.themeData(
                Styles.darkColorScheme,
                ApplicationOptions.of(context).themeColor,
                ApplicationOptions.of(context).platform,
                ApplicationOptions.of(context).textTheme,
              ),
              localizationsDelegates: const [
                ...AutolayoutLocalizations.localizationsDelegates,
                LocaleNamesLocalizationsDelegate(),
              ],
              supportedLocales: AutolayoutLocalizations.supportedLocales,
              locale: ApplicationOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
              },
              initialRoute: Routes.launch,
              onGenerateRoute: Application.router.generator,
            );
          },
        ),
      ),
    );
  }
}
