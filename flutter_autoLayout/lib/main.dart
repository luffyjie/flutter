import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loan/loan_fill_page.dart';
import 'loan/loan_page.dart';
import 'pay/pay_method_list.dart';

void main() {
  runApp(
    MaterialApp(
      title: "AutoLayout",
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(),
      routes: {
        '/loan': (BuildContext contenxt) => LoanPage(),
        '/loan_fill': (BuildContext contenxt) => LoanFillPage(),
        '/pay_method_List': (BuildContext context) => PayMethodListPage()
      },
      // initialRoute: '/loan',
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageSatate createState() => _MyHomePageSatate();
}

class _MyHomePageSatate extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: CupertinoButton(
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loan');
                    }),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                color: Colors.green,
                width: 100,
                height: 100,
                child: Image.asset('assets/images/calamares.jpg',
                    fit: BoxFit.contain),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "A",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.star, color: Colors.red[500]),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      "AAAA",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  color: Colors.amber,
                  child: Text("Hello World"),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.bodyText1.fontSize * 1.1 +
                      100.0,
                ),
                padding: const EdgeInsets.all(8.0),
                color: Colors.blue[600],
                alignment: Alignment.center,
                child: Text('Hello World',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white)),
                transform: Matrix4.rotationZ(0.1),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }
}
