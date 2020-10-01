import 'package:flutter_autoLayout/public.dart';

enum BottomSheetDemoType {
  persistent,
  modal,
}

class BottomSheetDemo extends StatelessWidget {
  const BottomSheetDemo({Key key, @required this.type}) : super(key: key);

  final BottomSheetDemoType type;

  String _title(BuildContext context) {
    switch (type) {
      case BottomSheetDemoType.persistent:
        return AutolayoutLocalizations.of(context)
            .demoBottomSheetPersistentTitle;
      case BottomSheetDemoType.modal:
        return AutolayoutLocalizations.of(context).demoBottomSheetModalTitle;
    }
    return '';
  }

  Widget _bottomSheetDemo(BuildContext context) {
    switch (type) {
      case BottomSheetDemoType.persistent:
        return _PersistentBottomSheetDemo();
      case BottomSheetDemoType.modal:
      default:
        return _ModalBottomSheetDemo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: ValueKey(type),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(_title(context)),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.add,
                semanticLabel:
                    AutolayoutLocalizations.of(context).demoBottomSheetAddLabel,
              ),
            ),
            body: _bottomSheetDemo(context),
          ),
        );
      },
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 70,
            child: Center(
              child: Text(
                AutolayoutLocalizations.of(context).demoBottomSheetHeader,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 21,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(AutolayoutLocalizations.of(context)
                          .demoBottomSheetItem(index)),
                    );
                  }))
        ],
      ),
    );
  }
}

class _ModalBottomSheetDemo extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetContent();
      },
    );
  }

  @override
  Widget build(Object context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child:
            Text(AutolayoutLocalizations.of(context).demoBottomSheetButtonText),
      ),
    );
  }
}

class _PersistentBottomSheetDemo extends StatefulWidget {
  @override
  _PersistentBottomSheetDemoState createState() =>
      _PersistentBottomSheetDemoState();
}

class _PersistentBottomSheetDemoState
    extends State<_PersistentBottomSheetDemo> {
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showPersistentBottomSheet;
  }

  void _showPersistentBottomSheet() {
    setState(() {
      _showBottomSheetCallback = null;
    });

    Scaffold.of(context)
        .showBottomSheet(
          (context) {
            return _BottomSheetContent();
          },
          elevation: 2,
        )
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showBottomSheetCallback = _showPersistentBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: _showBottomSheetCallback,
        child:
            Text(AutolayoutLocalizations.of(context).demoBottomSheetButtonText),
      ),
    );
  }
}
