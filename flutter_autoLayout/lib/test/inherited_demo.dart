import 'package:flutter_autoLayout/public.dart';

class _ShareDataWidget extends InheritedWidget {
  _ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  static _ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ShareDataWidget>();
  }

  final int data;
  @override
  bool updateShouldNotify(_ShareDataWidget oldWidget) {
    print('$data');
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      _ShareDataWidget.of(context).data.toString(),
    );
  }

  @override
  void didUpdateWidget(_TestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget-_TestWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies-change _TestWidgetState");
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() => new _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int data = 0;

  @override
  void initState() {
    super.initState();
    print("initState-_InheritedWidgetDemoState");
  }

  @override
  void didUpdateWidget(InheritedWidgetDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget-InheritedWidgetDemo");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies-InheritedWidgetDemo");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _ShareDataWidget(
        data: data,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            Builder(
              builder: (context) {
                print("RaisedButton build");
                return RaisedButton(
                  child: Text("Increment"),
                  onPressed: () {
                    ++data;
                    if (data % 3 == 1) {
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
