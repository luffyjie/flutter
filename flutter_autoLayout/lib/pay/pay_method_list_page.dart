import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoLayout/public.dart';

class PayMethodListPage extends BasicPage {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Select Payment Method'),
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        child: Scaffold(
          body: SafeArea(child: Column()),
        ));
  }
}
