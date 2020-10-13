import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autoLayout/app/launch/launch_page.dart';
import 'package:flutter_autoLayout/garage/garage_app.dart';
import 'package:flutter_autoLayout/route/routes.dart';
import 'package:flutter_autoLayout/themes/theme_data.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'public.dart';

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
      initialModel: AutolayoutOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customtextDirection: CustomtextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: "Flutter_AutoLayout",
            debugShowCheckedModeBanner: false,
            themeMode: AutolayoutOptions.of(context).themeMode,
            theme: AutolayoutThemeData.lightThemeData
                .copyWith(platform: AutolayoutOptions.of(context).platform),
            darkTheme: AutolayoutThemeData.darkThemeData
                .copyWith(platform: AutolayoutOptions.of(context).platform),
            localizationsDelegates: const [
              ...AutolayoutLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            supportedLocales: AutolayoutLocalizations.supportedLocales,
            locale: AutolayoutOptions.of(context).locale,
            localeResolutionCallback: (locale, supportedLocales) {
              deviceLocale = locale;
              return locale;
            },
            routes: {
              '/garage': (BuildContext context) => GarageApp(),
            },
            home: LaunchPage(),
            onGenerateRoute: Application.router.generator,
          );
        },
      ),
    );
  }
}
