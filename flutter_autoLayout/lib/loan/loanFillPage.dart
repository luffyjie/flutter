import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoanFillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Loan'),
          trailing: IconButton(
            icon: Icon(
              CupertinoIcons.add,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/loanFill',
                  arguments: {"loanId": "1"});
            },
          ),
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        child: Row(
          children: <Widget>[
            // 根据 flex系数，分配剩余空间
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.purple])),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange])),
                ))
          ],
        ));
  }
}
