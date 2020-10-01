import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/themes/theme_data.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'public.dart';
import 'gallery_public.dart';
import 'loan/loan_fill_page.dart';
import 'loan/loan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter_AutoLayout",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AutolayoutThemeData.lightThemeData,
        darkTheme: AutolayoutThemeData.darkThemeData,
        home: MyHomePage(),
        routes: {
          '/loan': (BuildContext contenxt) => LoanPage(),
          '/loan_fill': (BuildContext contenxt) => LoanFillPage(),
          '/pay_method_List': (BuildContext context) => PayMethodListPage(),
          // demo
          '/banner_demo': (BuildContext context) => BannerDemo(),
          '/bottomappbar_demo': (BuildContext context) => BottomAppBarDemo(),
          '/bottomnavigation_demo': (BuildContext context) =>
              BotttomNavigationDemo(
                type: BottomNavigationDemoType.withLables,
              ),
          '/bottom_sheet_demo': (BuildContext context) => BottomSheetDemo(
                type: BottomSheetDemoType.modal,
              ),
          '/button_demo': (BuildContext context) => ButtonDemo(),
        },
        localizationsDelegates: const [
          ...AutolayoutLocalizations.localizationsDelegates,
          LocaleNamesLocalizationsDelegate()
        ],
        // locale: const Locale('zh', 'en'),
        supportedLocales: AutolayoutLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          return locale;
        }
        // initialRoute: '/loan',
        );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageSatate createState() => _MyHomePageSatate();
}

class _MyHomePageSatate extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  )),
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
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }
}
