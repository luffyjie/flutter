import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autoLayout/public.dart';
import 'package:flutter_autoLayout/garage/garage_app.dart';
import 'package:flutter_autoLayout/route/routes.dart';
import 'package:flutter_autoLayout/themes/theme_data.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(App());
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
    return ModelBinding(
      initialModel: ApplicationOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customtextDirection: CustomtextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
      ),
      child: Builder(
        builder: (context) {
          return OKToast(
            child: MaterialApp(
              title: "Flutter_AutoLayout",
              debugShowCheckedModeBanner: false,
              themeMode: ApplicationOptions.of(context).themeMode,
              theme: AppThemeData.lightThemeData
                  .copyWith(platform: ApplicationOptions.of(context).platform),
              darkTheme: AppThemeData.darkThemeData
                  .copyWith(platform: ApplicationOptions.of(context).platform),
              localizationsDelegates: const [
                ...AutolayoutLocalizations.localizationsDelegates,
                LocaleNamesLocalizationsDelegate()
              ],
              supportedLocales: AutolayoutLocalizations.supportedLocales,
              locale: ApplicationOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
              },
              routes: {
                '/garage': (BuildContext context) => GarageApp(),
              },
              initialRoute: Routes.launch,
              onGenerateRoute: Application.router.generator,
            ),
          );
        },
      ),
    );
  }
}
