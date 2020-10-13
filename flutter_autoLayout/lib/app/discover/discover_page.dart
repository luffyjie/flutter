import 'package:flutter_autoLayout/public.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('discvoer'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: Text('discover'),
        ),
      ),
    );
  }
}
