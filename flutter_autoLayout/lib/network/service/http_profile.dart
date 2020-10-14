class HttpProfile {
  String apiDomain;
  String fileDomain;
  String webDomain;
  String kycDomain;

  static final HttpProfile _instance = HttpProfile._online();

  HttpProfile._online() {
    apiDomain = 'https://app-api.fastpay.com.tw';
    fileDomain = 'https://storage.googleapis.com/img-fastpay';
    webDomain = 'https://h5-fastpay.web.app';
    kycDomain = 'https://api-sgp.megvii.com';
  }

  factory HttpProfile() {
    return _instance;
  }
}

class NetworkCode {
  static const NETWORK_ERROR = -1;

  static const NETWORK_TIMEOUT = -2;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    return message;
  }
}
