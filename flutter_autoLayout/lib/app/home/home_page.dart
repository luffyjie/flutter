import 'package:flutter_autoLayout/public.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          child: Text('home'),
        ),
      ),
    );
  }
}
