import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///This basic page use safeArea+column+CupertionPageScaffold+CupertionNavBar
///
class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(child: Column()),
    );
  }
}
