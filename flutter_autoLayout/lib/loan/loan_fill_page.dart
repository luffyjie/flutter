import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';
import '../widget/submit_button.dart';

class LoanFillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Loan'),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 22.5, right: 22, top: 20),
                  width: 200,
                  height: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  margin:
                      const EdgeInsets.only(left: 34, right: 34, bottom: 15),
                  child: SubmitButton(
                    name: "SUBMIT",
                    onPressed: () {
                      print(222);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
