import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_autolayout/app/loan/loan_page.dart';
import 'package:flutter_autolayout/public.dart';

class LoanRouter implements RouterProtocol {
  static String loan = 'loan';

  @override
  void initRouter(fluro.Router router) {
    router.define(loan, handler: loanRoutehandler);
  }
}

var loanRoutehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoanPage();
});
