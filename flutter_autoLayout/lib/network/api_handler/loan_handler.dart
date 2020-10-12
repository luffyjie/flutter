import 'package:flutter_autoLayout/network/service/service.dart';
import 'package:flutter_autoLayout/network/service/service_model.dart';

class LoanHandler {
  var _service = Service();
  final _listPath = "/api/v1/loan/repayLoanList";

  Stream<Result> loanList() {
    var resource = Resource(_listPath, Map());
    return _service.request(resource);
  }
}
