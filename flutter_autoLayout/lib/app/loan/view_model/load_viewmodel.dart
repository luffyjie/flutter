import 'package:flutter_autoLayout/network/api_handler/loan_handler.dart';

class LoanViewModel {
  final _loanHandler = LoanHandler();

  void loanList() {
    _loanHandler.loanList().listen(
      (result) {},
      onDone: () {
        print('onDone');
      },
      onError: () {
        print('onError');
      },
    );
  }
}
