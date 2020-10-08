import 'package:flutter_autoLayout/public.dart';

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo();

  @override
  State createState() => _BottomAppBarDemoSate();
}

class _BottomAppBarDemoSate extends State<BottomAppBarDemo> {
  var _showFab = true;
  var _showNotch = true;
  var _fabLocation = FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation value) {
    setState(() {
      _fabLocation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoBottomAppBarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: [
          SwitchListTile(
              title: Text(
                  AutolayoutLocalizations.of(context).demoFloatingButtonTitle),
              value: _showFab,
              onChanged: _onShowFabChanged),
          SwitchListTile(
              title:
                  Text(AutolayoutLocalizations.of(context).bottomAppBarNotch),
              value: _showNotch,
              onChanged: _onShowNotchChanged),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                  AutolayoutLocalizations.of(context).bottomAppBarPosition)),
          RadioListTile<FloatingActionButtonLocation>(
              title: Text(AutolayoutLocalizations.of(context)
                  .bottomAppBarPositionDockedEnd),
              value: FloatingActionButtonLocation.endDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged),
          RadioListTile<FloatingActionButtonLocation>(
              title: Text(AutolayoutLocalizations.of(context)
                  .bottomAppBarPositionDockedCenter),
              value: FloatingActionButtonLocation.centerDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged),
          RadioListTile<FloatingActionButtonLocation>(
              title: Text(AutolayoutLocalizations.of(context)
                  .bottomAppBarPositionFloatingEnd),
              value: FloatingActionButtonLocation.endFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged),
          RadioListTile<FloatingActionButtonLocation>(
              title: Text(AutolayoutLocalizations.of(context)
                  .bottomAppBarPositionFloatingCenter),
              value: FloatingActionButtonLocation.centerFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged)
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                print('FLoating action button pressed');
              },
              child: const Icon(Icons.add),
              tooltip: AutolayoutLocalizations.of(context).buttonTextCreate,
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemBottomAppBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    );
  }
}

class _DemBottomAppBar extends StatelessWidget {
  const _DemBottomAppBar({this.fabLocation, this.shape});

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;

  static final centerLocation = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: shape,
        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              children: [
                IconButton(
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    print('Menu button pressed');
                  },
                ),
                if (centerLocation.contains(fabLocation)) const Spacer(),
                IconButton(
                  tooltip: AutolayoutLocalizations.of(context)
                      .starterAppTooltipSearch,
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('Search button pressed');
                  },
                ),
                IconButton(
                  tooltip: AutolayoutLocalizations.of(context)
                      .starterAppTooltipFavorite,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    print('Favorite button pressed');
                  },
                ),
              ],
            )));
  }
}
