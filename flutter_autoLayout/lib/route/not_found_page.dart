import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Not Find'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: Text('NO DATA'),
        ),
      ),
    );
  }
}
