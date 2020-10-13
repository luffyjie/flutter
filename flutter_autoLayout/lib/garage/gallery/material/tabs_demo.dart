import 'package:flutter_autoLayout/public.dart';

enum TabsDemoType {
  scrollable,
  nonScrollable,
}

class TabsDemo extends StatelessWidget {
  const TabsDemo({Key key, this.type}) : super(key: key);
  final TabsDemoType type;

  @override
  Widget build(BuildContext context) {
    Widget tabs;
    switch (type) {
      case TabsDemoType.scrollable:
        tabs = _TabsScrollableDemo();
        break;
      case TabsDemoType.nonScrollable:
        tabs = _TabsNonScrollableDemo();
        break;
    }
    return tabs;
  }
}

class _TabsScrollableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      AutolayoutLocalizations.of(context).colorsRed,
      AutolayoutLocalizations.of(context).colorsOrange,
      AutolayoutLocalizations.of(context).colorsGreen,
      AutolayoutLocalizations.of(context).colorsBlue,
      AutolayoutLocalizations.of(context).colorsIndigo,
      AutolayoutLocalizations.of(context).colorsPurple,
      AutolayoutLocalizations.of(context).colorsRed,
      AutolayoutLocalizations.of(context).colorsOrange,
      AutolayoutLocalizations.of(context).colorsGreen,
      AutolayoutLocalizations.of(context).colorsBlue,
      AutolayoutLocalizations.of(context).colorsIndigo,
      AutolayoutLocalizations.of(context).colorsPurple,
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Text(AutolayoutLocalizations.of(context).demoTabsScrollingTitle),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      AutolayoutLocalizations.of(context).colorsRed,
      AutolayoutLocalizations.of(context).colorsOrange,
      AutolayoutLocalizations.of(context).colorsGreen,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
              AutolayoutLocalizations.of(context).demoTabsNonScrollingTitle),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              for (final tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
