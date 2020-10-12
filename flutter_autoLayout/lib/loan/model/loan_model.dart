class MGLLoanConfigModel {
  dynamic phoneList;
  double serviceTotal;
  int serviceTotalType;
  String loanCurrency;
  int contractLength;

  MGLLoanConfigModel({
    this.phoneList,
    this.serviceTotal,
    this.serviceTotalType,
    this.loanCurrency,
    this.contractLength,
  });

  MGLLoanConfigModel.fromJson(Map<String, dynamic> json) {
    phoneList = json['phoneList'];
    serviceTotal = json['serviceTotal'] as double;
    serviceTotalType = json['serviceTotalType'] as int;
    loanCurrency = json['loanCurrency'] as String;
    contractLength = json['contractLength'] as int;
  }
}
