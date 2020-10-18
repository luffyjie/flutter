import 'package:flutter_autoLayout/public.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AutolayoutLocalizations.of(context).setting),
      ),
      body: Center(
        child: Container(
          child: Text('Setting'),
        ),
      ),
    );
  }
}
