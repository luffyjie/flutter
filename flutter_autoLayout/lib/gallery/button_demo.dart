import 'package:flutter_autoLayout/public.dart';

enum ButtonDemoType {
  flat,
  raised,
  outline,
  toggle,
  floating,
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Button Demo"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _FlatButtonDemo(),
          SizedBox(height: 20),
          _RaisedButtonDemo(),
          SizedBox(height: 20),
          _OutlineButtonDemo(),
          SizedBox(height: 20),
          _ToggleButtonsDemo(),
          SizedBox(height: 20),
          _FloatingActionButtonDemo(),
        ],
      ),
    );
  }
}

class _FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text('Flat button'),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(AutolayoutLocalizations.of(context).buttonText),
          ),
          const SizedBox(width: 15),
          FlatButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
            label: Text(AutolayoutLocalizations.of(context).buttonText),
          )
        ],
      ),
    );
  }
}

class _RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text('Raised button'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(AutolayoutLocalizations.of(context).buttonText),
          ),
          const SizedBox(width: 15),
          RaisedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
            label: Text(AutolayoutLocalizations.of(context).buttonText),
          ),
        ],
      ),
    );
  }
}

class _OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text('Outline button'),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text(AutolayoutLocalizations.of(context).buttonText),
            highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          ),
          const SizedBox(width: 15),
          OutlineButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 18,
            ),
            label: Text(AutolayoutLocalizations.of(context).buttonText),
            highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          )
        ],
      ),
    );
  }
}

class _ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> {
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text('Toggle button'),
        ),
        ToggleButtons(
          children: const [
            Icon(Icons.ac_unit),
            Icon(Icons.call),
            Icon(Icons.cake),
          ],
          onPressed: (index) {
            setState(() {
              isSelected[index] = !isSelected[index];
            });
          },
          isSelected: isSelected,
        ),
      ],
    ));
  }
}

class _FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text('Toggle button'),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            tooltip: AutolayoutLocalizations.of(context).buttonTextCreate,
          ),
          SizedBox(width: 15),
          FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add),
              heroTag: 'other',
              label:
                  Text(AutolayoutLocalizations.of(context).buttonTextCreate)),
        ],
      ),
    );
  }
}
