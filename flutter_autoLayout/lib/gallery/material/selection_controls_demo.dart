import 'package:flutter_autoLayout/public.dart';

enum SelectionControlsDemoType {
  checkbox,
  radio,
  switches,
}

class SelectionControlsDemo extends StatelessWidget {
  String _title(BuildContext context, SelectionControlsDemoType type) {
    switch (type) {
      case SelectionControlsDemoType.checkbox:
        return AutolayoutLocalizations.of(context)
            .demoSelectionControlsCheckboxTitle;
      case SelectionControlsDemoType.radio:
        return AutolayoutLocalizations.of(context)
            .demoSelectionControlsRadioTitle;
      case SelectionControlsDemoType.switches:
        return AutolayoutLocalizations.of(context)
            .demoSelectionControlsSwitchTitle;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Selection'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(_title(context, SelectionControlsDemoType.checkbox)),
            _Checkboxdemo(),
            SizedBox(height: 20),
            Text(_title(context, SelectionControlsDemoType.checkbox)),
            _RadioDemo(),
            SizedBox(height: 20),
            Text(_title(context, SelectionControlsDemoType.checkbox)),
            _SwitchDemo(),
          ],
        ),
      ),
    );
  }
}

class _Checkboxdemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<_Checkboxdemo> {
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
              value: checkboxValueA,
              onChanged: (value) {
                setState(() {
                  checkboxValueA = value;
                });
              }),
          Checkbox(
              value: checkboxValueB,
              onChanged: (value) {
                setState(() {
                  checkboxValueB = value;
                });
              }),
          Checkbox(
              value: checkboxValueC,
              tristate: true,
              onChanged: (value) {
                setState(() {
                  checkboxValueC = value;
                });
              }),
        ],
      ),
    );
  }
}

class _RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<_RadioDemo> {
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < 3; ++index)
            Radio<int>(
              value: index,
              groupValue: radioValue,
              onChanged: handleRadioValueChanged,
            ),
        ],
      ),
    );
  }
}

class _SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<_SwitchDemo> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        container: true,
        label: AutolayoutLocalizations.of(context)
            .demoSelectionControlsSwitchTitle,
        child: Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            }),
      ),
    );
  }
}
