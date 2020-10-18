import 'package:flutter_autoLayout/public.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Message'),
      ),
      body: Center(
        child: Container(
          child: Text('Message'),
        ),
      ),
    );
  }
}
