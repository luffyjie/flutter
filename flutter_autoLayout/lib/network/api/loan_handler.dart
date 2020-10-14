import '../http/data_helper.dart';
import '../http/http_model.dart';
import '../http/service.dart';

class LoanHandler {
  final _listPath = "/api/v1/loan/repayLoanList";

  Future<Result> loanList() async {
    var parameters = DataHelper.getBaseMap();
    var resource = Resource(_listPath, parameters);
    Result result = Service.request(resource);
    return result;
  }
}
