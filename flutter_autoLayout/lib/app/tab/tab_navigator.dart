import 'package:flutter_autoLayout/app/discover/discover_page.dart';
import 'package:flutter_autoLayout/app/user/uer_page.dart';
import 'package:flutter_autoLayout/public.dart';
import 'package:flutter_autoLayout/app/home/home_page.dart';

List<Widget> pages = <Widget>[
  HomePage(),
  DiscoverPage(),
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: 'discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            label: 'me',
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
