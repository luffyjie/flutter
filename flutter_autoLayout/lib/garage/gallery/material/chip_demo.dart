import 'package:flutter_autoLayout/public.dart';

enum ChipDemoType {
  action,
  choice,
  filter,
  input,
}

class ChipDemo extends StatelessWidget {
  String _title(BuildContext context, ChipDemoType type) {
    switch (type) {
      case ChipDemoType.action:
        return AutolayoutLocalizations.of(context).demoActionChipTitle;
      case ChipDemoType.choice:
        return AutolayoutLocalizations.of(context).demoChoiceChipTitle;
      case ChipDemoType.filter:
        return AutolayoutLocalizations.of(context).demoFilterChipTitle;
      case ChipDemoType.input:
        return AutolayoutLocalizations.of(context).demoInputChipTitle;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chip demo'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                _title(context, ChipDemoType.action),
              ),
              SizedBox(width: 15),
              _ActionChipDemo()
            ],
          ),
          Row(
            children: [
              Text(
                _title(context, ChipDemoType.choice),
              ),
              SizedBox(width: 15),
              _ChoiceChipDemo()
            ],
          ),
          Row(
            children: [
              Text(
                _title(context, ChipDemoType.filter),
              ),
              SizedBox(width: 15),
              _FliterChipDemo()
            ],
          ),
          Row(
            children: [
              Text(
                _title(context, ChipDemoType.input),
              ),
              SizedBox(width: 15),
              _InputChipDemo()
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        onPressed: () {},
        avatar: const Icon(
          Icons.brightness_5,
          color: Colors.black54,
        ),
        label: Text(AutolayoutLocalizations.of(context).chipTurnOnLights),
      ),
    );
  }
}

class _ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<_ChoiceChipDemo> {
  int indexSelected = -1;

  @override
  Widget build(Object context) {
    return Center(
      child: Wrap(
        children: [
          ChoiceChip(
            label: Text(AutolayoutLocalizations.of(context).chipSmall),
            selected: indexSelected == 0,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 0 : -1;
              });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(AutolayoutLocalizations.of(context).chipMedium),
            selected: indexSelected == 1,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 0 : -1;
              });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(AutolayoutLocalizations.of(context).chipLarge),
            selected: indexSelected == 2,
            onSelected: (value) {
              setState(() {
                indexSelected = value ? 2 : -1;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _FliterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<_FliterChipDemo> {
  bool isSelectedElevator = false;
  bool isSelectedWasher = false;
  bool isSelectedFireplace = false;

  @override
  Widget build(Object context) {
    final chips = [
      FilterChip(
          label: Text(AutolayoutLocalizations.of(context).chipElevator),
          selected: isSelectedElevator,
          onSelected: (value) {
            isSelectedElevator = !isSelectedElevator;
          }),
      FilterChip(
        label: Text(AutolayoutLocalizations.of(context).chipWasher),
        selected: isSelectedWasher,
        onSelected: (value) {
          setState(() {
            isSelectedWasher = !isSelectedWasher;
          });
        },
      ),
      FilterChip(
        label: Text(AutolayoutLocalizations.of(context).chipFireplace),
        selected: isSelectedFireplace,
        onSelected: (value) {
          setState(() {
            isSelectedFireplace = !isSelectedFireplace;
          });
        },
      ),
    ];

    return Center(
      child: Wrap(
        children: [
          for (final chip in chips)
            Padding(
              padding: const EdgeInsets.all(4),
              child: chip,
            )
        ],
      ),
    );
  }
}

class _InputChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputChip(
          label: Text(AutolayoutLocalizations.of(context).chipBiking),
          onPressed: () {},
          onDeleted: () {},
          avatar: const Icon(
            Icons.directions_bike,
            size: 20,
            color: Colors.black54,
          ),
          deleteIconColor: Colors.black54),
    );
  }
}
