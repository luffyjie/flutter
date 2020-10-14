import 'package:flutter_autoLayout/network/service/data_helper.dart';
import 'package:flutter_autoLayout/network/service/http_model.dart';
import 'package:flutter_autoLayout/network/service/service.dart';

class LoanApi {
  final _listPath = "/api/v1/loan/repayLoanList";

  Future<Result> loanList() async {
    var parameters = DataHelper.getBaseMap();
    var resource = Resource(_listPath, parameters);
    Result result = Service.request(resource);
    return result;
  }
}
