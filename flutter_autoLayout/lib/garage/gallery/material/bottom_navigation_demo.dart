import 'package:flutter_autoLayout/public.dart';
import 'package:animations/animations.dart';

enum BottomNavigationDemoType {
  withLables,
  withoutLabels,
}

class BotttomNavigationDemo extends StatefulWidget {
  const BotttomNavigationDemo({Key key, @required this.type}) : super(key: key);

  final BottomNavigationDemoType type;
  @override
  _BotttomNavigationDemoState createState() => _BotttomNavigationDemoState();
}

class _BotttomNavigationDemoState extends State<BotttomNavigationDemo> {
  int _currentIndex = 0;

  String _title(BuildContext context) {
    switch (widget.type) {
      case BottomNavigationDemoType.withLables:
        return AutolayoutLocalizations.of(context)
            .demoBottomNavigationPersistentLabels;
      case BottomNavigationDemoType.withoutLabels:
        return AutolayoutLocalizations.of(context)
            .demoBottomNavigationSelectedLabel;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.add_comment),
          label:
              AutolayoutLocalizations.of(context).bottomNavigationCommentsTab),
      BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_today),
          label:
              AutolayoutLocalizations.of(context).bottomNavigationCalendarTab),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label:
              AutolayoutLocalizations.of(context).bottomNavigationAccountTab),
      BottomNavigationBarItem(
          icon: const Icon(Icons.alarm_on),
          label: AutolayoutLocalizations.of(context).bottomNavigationAlarmTab),
      BottomNavigationBarItem(
          icon: const Icon(Icons.camera_enhance),
          label:
              AutolayoutLocalizations.of(context).bottomNavigationCalendarTab),
    ];
    if (widget.type == BottomNavigationDemoType.withLables) {
      bottomNavigationBarItems = bottomNavigationBarItems.sublist(
          0, bottomNavigationBarItems.length - 2);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title(context)),
        centerTitle: true,
      ),
      body: Center(
        child: PageTransitionSwitcher(
          child: _NavigationDestinationView(
            key: UniqueKey(),
            item: bottomNavigationBarItems[_currentIndex],
          ),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels:
            widget.type == BottomNavigationDemoType.withLables,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.caption.fontSize,
        unselectedFontSize: textTheme.caption.fontSize,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  _NavigationDestinationView({Key key, this.item}) : super(key: key);

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/demos/bottom_navigation_background.png',
                  package: 'flutter_gallery_assets',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(
              label: AutolayoutLocalizations.of(context)
                  .bottomNavigationContentPlaceholder(item.label),
            ),
          ),
        )
      ],
    );
  }
}
