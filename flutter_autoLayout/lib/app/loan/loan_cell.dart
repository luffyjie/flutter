import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class LoanCellPage extends StatelessWidget {
  final String iconName;
  final String loanName;
  final String loanSubStr;
  final String loanId;

  const LoanCellPage(
      {Key key, this.iconName, this.loanName, this.loanSubStr, this.loanId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    width: 43,
                    height: 43,
                    child: Image.asset('assets/images/' + iconName,
                        fit: BoxFit.cover)),
              ),
              Spacer(flex: 1),
              Container(
                height: 26,
                width: 76,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.5),
                  child: FlatButton(
                    color: Color(0xFF47A0E3),
                    child: Text('Repay',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loan_fill',
                          arguments: {"loanId": loanId});
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(loanName,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Expanded(
                  child: Text(loanSubStr,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
