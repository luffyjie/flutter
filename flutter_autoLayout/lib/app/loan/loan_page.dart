import 'package:flutter_autolayout/app/loan/viewmodel/loan_viewmodel.dart';
import 'package:flutter_autolayout/basic/basic_view.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'loan_cell.dart';

class LoanPage extends StatefulWidget {
  _LoanPageState createState() => new _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  List fd = [
    {
      "tid": "1",
      "name": "KABAYAN LOAN",
      "subStr": "Powered by Summerset Lending Incorporated",
      "image": "bokchoy.png"
    },
    {
      "tid": "2",
      "name": "KABAYAN LOAN2",
      "subStr": "butter by Summerset Lending Incorporated",
      "image": "butter.png"
    },
    {
      "tid": "3",
      "name": "KABAYAN LOAN3",
      "subStr": "cabbage by Summerset Lending Incorporated",
      "image": "cabbage.png"
    },
    {
      "tid": "4",
      "name": "KABAYAN LOAN4",
      "subStr": "calamares by Summerset Lending Incorporated",
      "image": "calamares.jpg"
    }
  ];
  Map fi;

  @override
  void initState() {
    super.initState();
    setState(() => fi = fd[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan'),
      ),
      body: BaseView<LoanViewModel>(
        onModelReady: (model) {
          model.loanList();
        },
        model: LoanViewModel(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return ViewStateBusyWidget();
          }
          if (model.isIdle) {
            return ViewStateErrorWidget(
              title: "ss",
              message: "lkajsdjajdaldjal",
              buttonText: "Reload",
              image: 'service_error',
              onPressed: model.loanList,
            );
          }
          return _buildBody(context, model);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, LoanViewModel model) {
    return SafeArea(
      child: Column(
        children: [
          Text(model.data != null ? 'success' : 'error'),
          SizedBox(
            height: 25,
            width: 19,
          ),
          SizedBox(
            height: 160,
            child: Swiper(
                itemHeight: 300,
                itemWidth: 400,
                onIndexChanged: (n) => setState(() => fi = fd[n]),
                itemCount: fd.length,
                itemBuilder: (cx, i) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Hero(
                          tag: fd[i]['tid'],
                          child: Image.asset('assets/images/' + fd[i]['image'],
                              fit: BoxFit.cover)),
                    ),
                  );
                },
                viewportFraction: 0.9,
                scale: 0.8),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 120,
              itemBuilder: (BuildContext context, int index) {
                return LoanCellPage(
                    iconName: fi["image"],
                    loanName: fi["name"],
                    loanId: fi["tid"],
                    loanSubStr: fi["subStr"]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
