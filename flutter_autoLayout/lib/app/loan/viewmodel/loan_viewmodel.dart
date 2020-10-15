import 'package:flutter_autoLayout/public.dart';

class LoanViewModel extends BaseModel {
  final _listPath = "/api/v1/loan/repayLoanList";
  final _initConfig = '/api/v1/init/initConfig';

  Result data;

  loanList() async {
    setBusy();
    var parameters = DataHelper.getBaseMap();
    var resource = Resource(_initConfig, parameters);
    Result result = await Service.request(resource);
    data = result;
    setIdle();
  }
}
