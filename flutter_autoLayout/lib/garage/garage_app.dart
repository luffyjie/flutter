import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_autoLayout/app/loan/loan_fill_page.dart';
import 'package:flutter_autoLayout/app/loan/loan_page.dart';
import 'package:flutter_autoLayout/app/pay/pay_method_list_page.dart';
import 'package:flutter_autoLayout/public.dart';
import 'package:flutter_autoLayout/themes/theme_data.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'garage_public.dart';

class GarageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            home: GaragePage(),
            routes: {
              '/loan': (BuildContext contenxt) => LoanPage(),
              '/loan_fill': (BuildContext contenxt) => LoanFillPage(),
              '/pay_method_List': (BuildContext context) => PayMethodListPage(),
              // demo
              '/banner_demo': (BuildContext context) => BannerDemo(),
              '/bottomappbar_demo': (BuildContext context) =>
                  BottomAppBarDemo(),
              '/bottomnavigation_demo': (BuildContext context) =>
                  BotttomNavigationDemo(
                    type: BottomNavigationDemoType.withLables,
                  ),
              '/bottom_sheet_demo': (BuildContext context) => BottomSheetDemo(
                    type: BottomSheetDemoType.modal,
                  ),
              '/button_demo': (BuildContext context) => ButtonDemo(),
              '/cards_demo': (BuildContext context) => CardsDemo(),
              '/chip_demo': (BuildContext context) => ChipDemo(),
              '/data_table_demo': (BuildContext context) => DataTableDemo(),
              '/dialog_demo': (BuildContext context) => DialogDemo(),
              '/grid_list_demo': (BuildContext context) => GridListDemo(
                    type: GridListDemoType.header,
                  ),
              '/list_demo': (BuildContext context) => ListDemo(
                    type: ListDemoType.twoLine,
                  ),
              '/menu_demo': (BuildContext context) => MenuDemo(),
              '/picker_demo': (BuildContext context) => PickerDemo(),
              '/progress_indicator_demo': (BuildContext context) =>
                  ProgressIndicatorDemo(),
              '/selection_control_demo': (BuildContext context) =>
                  SelectionControlsDemo(),
              '/snackbar_demo': (BuildContext context) => SnackbarsDemo(),
              '/tabs_demo': (BuildContext context) =>
                  TabsDemo(type: TabsDemoType.nonScrollable),
              '/text_field_demo': (BuildContext context) => TextFieldDemo(),
              '/tooltip_demo': (BuildContext context) => TooltipDemo(),
              '/sliders_demo': (BuildContext context) => SlidersDemo(),
              '/cupertino_activity_indicator_demo': (BuildContext context) =>
                  CupertinoProgressIndicatorDemo(),
              '/cupertino_alert_demo': (BuildContext context) =>
                  CupertinoAlertDemo(),
              '/cupertino_button_demo': (BuildContext context) =>
                  CupertinoButtonDemo(),
              '/cupertino_navigation_demo': (BuildContext context) =>
                  CupertinoNavigationBarDemo(),
              '/cupertino_picker_demo': (BuildContext context) =>
                  CupertinoPickerDemo(),
              '/cupertino_refresh_demo': (BuildContext context) =>
                  CupertinoRefreshControlDemo(),
              '/cupertino_segmented_control_demo': (BuildContext context) =>
                  CupertinoSegmentedControlDemo(),
              '/cupertino_slider_demo': (BuildContext context) =>
                  CupertinoSliderDemo(),
              '/cupertino_switch_demo': (BuildContext context) =>
                  CupertinoSwitchDemo(),
              '/cupertino_tab_bar_demo': (BuildContext context) =>
                  CupertinoTabBarDemo(),
              '/cupertino_text_field_demo': (BuildContext context) =>
                  CupertinoTextFieldDemo(),
              '/dialog_buttons_demo': (BuildContext context) =>
                  DilogButtonsDemo(),
              '/webView_demo': (BuildContext context) => WebViewDemo(),
              // test demo
              '/inherited_demo': (BuildContext context) =>
                  InheritedWidgetDemo(),
              '/provider_demo': (BuildContext context) => ProviderDemo(),
            },
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
            // initialRoute: '/loan',
          );
        },
      ),
    );
  }
}

class GaragePage extends StatefulWidget {
  @override
  _GaragePageSatate createState() => _GaragePageSatate();
}

class _GaragePageSatate extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: FlatButton(
                    color: Colors.deepOrange,
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loan');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Gallery demo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  GalleryButton(
                      name: "Banner",
                      onPressed: () {
                        Navigator.pushNamed(context, '/banner_demo');
                      }),
                  GalleryButton(
                      name: "Bottom app Bar",
                      onPressed: () {
                        Navigator.pushNamed(context, '/bottomappbar_demo');
                      }),
                  GalleryButton(
                      name: "Bottom navigation",
                      onPressed: () {
                        Navigator.pushNamed(context, '/bottomnavigation_demo');
                      }),
                  GalleryButton(
                      name: "Bottom sheet",
                      onPressed: () {
                        Navigator.pushNamed(context, '/bottom_sheet_demo');
                      }),
                  GalleryButton(
                      name: "Button demo",
                      onPressed: () {
                        Navigator.pushNamed(context, '/button_demo');
                      }),
                  GalleryButton(
                    name: "Cards demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cards_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Chip demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/chip_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Data Table demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/data_table_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Dialog demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/dialog_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Grid list demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/grid_list_demo');
                    },
                  ),
                  GalleryButton(
                    name: "List demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/list_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Menu demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/menu_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Pikcer demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/picker_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Progress indicator demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/progress_indicator_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Selection control demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/selection_control_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Snackbar demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/snackbar_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Tabs demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/tabs_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Tooltip demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/tooltip_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Text field demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/text_field_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Sliders demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/sliders_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino activity indicator demo",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cupertino_activity_indicator_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino alert demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_alert_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino button demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_button_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino navigation demo",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cupertino_navigation_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino pikcer demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_picker_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino refresh demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_refresh_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino segmented control demo",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cupertino_segmented_control_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino slider demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_slider_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino switch demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_switch_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino tab bar demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/cupertino_tab_bar_demo');
                    },
                  ),
                  GalleryButton(
                    name: "cupertino text field demo",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cupertino_text_field_demo');
                    },
                  ),
                  GalleryButton(
                    name: "Dialog buttons demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/dialog_buttons_demo');
                    },
                  ),
                  GalleryButton(
                    name: "WebView demo",
                    onPressed: () {
                      Navigator.pushNamed(context, '/webView_demo');
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'inherited test',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  GalleryButton(
                    name: "inherited text demo",
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, '/inherited_demo');
                    },
                  ),
                  GalleryButton(
                    name: "provider demo",
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, '/provider_demo');
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/images/calamares.jpg',
                        fit: BoxFit.contain),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "A",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.star, color: Colors.red[500]),
                  Container(
                    width: 150,
                    height: 50,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      "AAAA",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  color: Colors.amber,
                  child: Text("Hello World"),
                ),
              ),
              SizedBox(
                height: 300,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ));
  }
}