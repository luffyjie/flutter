import 'package:flutter_autolayout/app/discover/discover_page.dart';
import 'package:flutter_autolayout/app/message/message_page.dart';
import 'package:flutter_autolayout/app/user/uer_page.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:flutter_autolayout/app/home/home_page.dart';

List<Widget> pages = <Widget>[
  HomePage(),
  DiscoverPage(),
  MessagePage(),
  UserPage(),
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  var _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          var thanOneSconds =
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1);
          if (_lastPressed == null || thanOneSconds) {
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AutolayoutLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: AutolayoutLocalizations.of(context).discovery,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: AutolayoutLocalizations.of(context).message,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            label: AutolayoutLocalizations.of(context).me,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
