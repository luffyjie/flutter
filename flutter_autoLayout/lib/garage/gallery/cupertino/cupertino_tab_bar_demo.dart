import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class _TabInfo {
  const _TabInfo(this.title, this.icon);

  final String title;
  final IconData icon;
}

class CupertinoTabBarDemo extends StatelessWidget {
  const CupertinoTabBarDemo();

  @override
  Widget build(BuildContext context) {
    final _tabInfo = [
      _TabInfo(
        AutolayoutLocalizations.of(context).cupertinoTabBarHomeTab,
        CupertinoIcons.home,
      ),
      _TabInfo(
        AutolayoutLocalizations.of(context).cupertinoTabBarChatTab,
        CupertinoIcons.conversation_bubble,
      ),
      _TabInfo(
        AutolayoutLocalizations.of(context).cupertinoTabBarProfileTab,
        CupertinoIcons.profile_circled,
      ),
    ];

    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            for (final tabInfo in _tabInfo)
              BottomNavigationBarItem(
                label: tabInfo.title,
                icon: Icon(tabInfo.icon),
              ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) => _CupertinoDemoTab(
              title: _tabInfo[index].title,
              icon: _tabInfo[index].icon,
            ),
            defaultTitle: _tabInfo[index].title,
          );
        },
      ),
    );
  }
}

class _CupertinoDemoTab extends StatelessWidget {
  const _CupertinoDemoTab({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: Icon(
          icon,
          color: Colors.blue,
          semanticLabel: title,
          size: 100,
        ),
      ),
    );
  }
}
