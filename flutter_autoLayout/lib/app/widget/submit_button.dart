import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const SubmitButton({Key key, this.name, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(22.5),
        child: FlatButton(
            child: Text(name,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
            color: Color(0xFF47A0E3),
            onPressed: () {}));
  }
}
