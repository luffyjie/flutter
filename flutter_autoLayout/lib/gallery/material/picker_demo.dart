import 'package:flutter_autoLayout/public.dart';
import 'package:intl/intl.dart';

enum PickerDemoType {
  date,
  time,
}

class PickerDemo extends StatefulWidget {
  @override
  _PickerDemoState createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  DateTime _fromate = DateTime.now();
  TimeOfDay _fromTime = TimeOfDay.fromDateTime(DateTime.now());

  String _title(PickerDemoType type) {
    switch (type) {
      case PickerDemoType.date:
        return AutolayoutLocalizations.of(context).demoDatePickerTitle;
      case PickerDemoType.time:
        return AutolayoutLocalizations.of(context).demoTimePickerTitle;
    }
    return '';
  }

  String _labeltext(PickerDemoType type) {
    switch (type) {
      case PickerDemoType.date:
        return DateFormat.yMMMMd().format(_fromate);
      case PickerDemoType.time:
        return _fromTime.format(context);
    }
    return '';
  }

  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromate) {
      setState(() {
        _fromate = picked;
      });
    }
  }

  Future<void> _showTimePicker() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _fromTime,
    );
    if (picked != null && picked != _fromTime) {
      setState(() {
        _fromTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Picker'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                _labeltext(PickerDemoType.date),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  _title(PickerDemoType.date),
                ),
                onPressed: () {
                  _showDatePicker();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                _labeltext(PickerDemoType.time),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  _title(PickerDemoType.time),
                ),
                onPressed: () {
                  _showTimePicker();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
