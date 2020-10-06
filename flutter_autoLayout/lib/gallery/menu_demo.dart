import 'package:flutter_autoLayout/public.dart';

enum MenudemoType {
  contextMenu,
  sectionedMenu,
  simpleMenu,
  checklistMenu,
}

enum SimpleValue {
  one,
  two,
  three,
}

enum CheckedValue {
  one,
  two,
  three,
  four,
}

class MenuDemo extends StatefulWidget {
  @override
  _MenuDemoState createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AutolayoutLocalizations.of(context).demoMenuTitle),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _ContextMenuDemo(showInSnackBar: showInSnackBar),
          _SectionedMenuDemo(showInSnackBar: showInSnackBar),
          _SimpleMenuDemo(showInSnackBar: showInSnackBar),
          _ChecklistMenuDemo(showInSnackBar: showInSnackBar),
        ],
      ),
    );
  }
}

class _ContextMenuDemo extends StatelessWidget {
  const _ContextMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

  final void Function(String vlaue) showInSnackBar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AutolayoutLocalizations.of(context)
          .demoMenuAnItemWithAContextMenuButton),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        onSelected: (value) => showInSnackBar(
          AutolayoutLocalizations.of(context).demoMenuSelected(value),
        ),
        itemBuilder: (context) => <PopupMenuItem<String>>[
          PopupMenuItem(
            value:
                AutolayoutLocalizations.of(context).demoMenuContextMenuItemOne,
            child: Text(
              AutolayoutLocalizations.of(context).demoMenuContextMenuItemOne,
            ),
          ),
          PopupMenuItem(
            enabled: false,
            child: Text(
                AutolayoutLocalizations.of(context).demoMenuADisabledMenuItem),
          ),
          PopupMenuItem(
            value: AutolayoutLocalizations.of(context)
                .demoMenuContextMenuItemThree,
            child: Text(AutolayoutLocalizations.of(context)
                .demoMenuContextMenuItemThree),
          ),
        ],
      ),
    );
  }
}

class _SectionedMenuDemo extends StatelessWidget {
  const _SectionedMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

  final void Function(String value) showInSnackBar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          AutolayoutLocalizations.of(context).demoMenuAnItemWithASectionedMenu),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        onSelected: (value) => showInSnackBar(
          AutolayoutLocalizations.of(context).demoMenuSelected(value),
        ),
        itemBuilder: (context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: AutolayoutLocalizations.of(context).demoMenuPreview,
            child: ListTile(
              leading: const Icon(Icons.visibility),
              title: Text(AutolayoutLocalizations.of(context).demoMenuPreview),
            ),
          ),
          PopupMenuItem<String>(
            value: AutolayoutLocalizations.of(context).demoMenuShare,
            child: ListTile(
              leading: const Icon(Icons.person_add),
              title: Text(AutolayoutLocalizations.of(context).demoMenuShare),
            ),
          ),
          PopupMenuItem<String>(
            value: AutolayoutLocalizations.of(context).demoMenuGetLink,
            child: ListTile(
              leading: const Icon(Icons.link),
              title: Text(AutolayoutLocalizations.of(context).demoMenuGetLink),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: Text(AutolayoutLocalizations.of(context).demoMenuRemove),
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleMenuDemo extends StatefulWidget {
  const _SimpleMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

  final void Function(String value) showInSnackBar;

  @override
  _SimpleMenuDemoState createState() => _SimpleMenuDemoState();
}

class _SimpleMenuDemoState extends State<_SimpleMenuDemo> {
  SimpleValue _simpleValue;

  void showAndSetMenuSelection(BuildContext context, SimpleValue value) {
    setState(() {
      _simpleValue = value;
    });
    widget.showInSnackBar(
      AutolayoutLocalizations.of(context).demoMenuSelected(
        simpleValueToString(context, value),
      ),
    );
  }

  String simpleValueToString(BuildContext context, SimpleValue value) => {
        SimpleValue.one:
            AutolayoutLocalizations.of(context).demoMenuItemValueOne,
        SimpleValue.two:
            AutolayoutLocalizations.of(context).demoMenuItemValueTwo,
        SimpleValue.three:
            AutolayoutLocalizations.of(context).demoMenuItemValueThree,
      }[value];

  @override
  void initState() {
    super.initState();
    _simpleValue = SimpleValue.two;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SimpleValue>(
      padding: EdgeInsets.zero,
      initialValue: _simpleValue,
      onSelected: (value) => showAndSetMenuSelection(context, value),
      child: ListTile(
        title: Text(
            AutolayoutLocalizations.of(context).demoMenuAnItemWithASimpleMenu),
        subtitle: Text(simpleValueToString(context, _simpleValue)),
      ),
      itemBuilder: (context) => <PopupMenuItem<SimpleValue>>[
        PopupMenuItem<SimpleValue>(
          value: SimpleValue.one,
          child: Text(
            simpleValueToString(context, SimpleValue.one),
          ),
        ),
        PopupMenuItem<SimpleValue>(
          value: SimpleValue.two,
          child: Text(simpleValueToString(context, SimpleValue.two)),
        ),
        PopupMenuItem(
          value: SimpleValue.three,
          child: Text(simpleValueToString(context, SimpleValue.three)),
        ),
      ],
    );
  }
}

class _ChecklistMenuDemo extends StatefulWidget {
  const _ChecklistMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

  final void Function(String value) showInSnackBar;

  @override
  _ChecklistMenuDemoState createState() => _ChecklistMenuDemoState();
}

class _ChecklistMenuDemoState extends State<_ChecklistMenuDemo> {
  List<CheckedValue> _checkedValues;

  @override
  void initState() {
    super.initState();
    _checkedValues = [CheckedValue.three];
  }

  void showCheckedMenuSelections(BuildContext context, CheckedValue value) {
    if (_checkedValues.contains(value)) {
      setState(() {
        _checkedValues.remove(value);
      });
    } else {
      setState(() {
        _checkedValues.add(value);
      });
    }
    widget.showInSnackBar(
      AutolayoutLocalizations.of(context).demoMenuChecked(
        _checkedValues.map((value) => checkedValueToString(context, value)),
      ),
    );
  }

  String checkedValueToString(BuildContext context, CheckedValue value) => {
        CheckedValue.one: AutolayoutLocalizations.of(context).demoMenuOne,
        CheckedValue.two: AutolayoutLocalizations.of(context).demoMenuTwo,
        CheckedValue.three: AutolayoutLocalizations.of(context).demoMenuThree,
        CheckedValue.four: AutolayoutLocalizations.of(context).demoMenuFour,
      }[value];

  bool isChecked(CheckedValue value) => _checkedValues.contains(value);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          AutolayoutLocalizations.of(context).demoMenuAnItemWithAChecklistMenu),
      trailing: PopupMenuButton<CheckedValue>(
        padding: EdgeInsets.zero,
        onSelected: (value) => showCheckedMenuSelections(context, value),
        itemBuilder: (context) => <PopupMenuItem<CheckedValue>>[
          CheckedPopupMenuItem<CheckedValue>(
            value: CheckedValue.one,
            checked: isChecked(CheckedValue.one),
            child: Text(checkedValueToString(context, CheckedValue.one)),
          ),
          CheckedPopupMenuItem<CheckedValue>(
            value: CheckedValue.two,
            enabled: false,
            checked: isChecked(CheckedValue.two),
            child: Text(checkedValueToString(context, CheckedValue.two)),
          ),
          CheckedPopupMenuItem<CheckedValue>(
            value: CheckedValue.three,
            checked: isChecked(CheckedValue.three),
            child: Text(checkedValueToString(context, CheckedValue.three)),
          ),
          CheckedPopupMenuItem<CheckedValue>(
            value: CheckedValue.four,
            checked: isChecked(CheckedValue.four),
            child: Text(checkedValueToString(context, CheckedValue.four)),
          ),
        ],
      ),
    );
  }
}
