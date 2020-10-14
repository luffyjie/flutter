import 'package:flutter_autoLayout/network/api/loan_handler.dart';
import 'package:flutter_autoLayout/public.dart';

class LoanViewModel extends BaseModel {
  final _listPath = "/api/v1/loan/repayLoanList";

  LoanHandler handler = LoanHandler();

  Future<Result> loanList() async {
    setBusy();
    var parameters = DataHelper.getBaseMap();
    var resource = Resource(_listPath, parameters);
    Result result = await Service.request(resource);
    setIdle();
    return result;
  }
}
