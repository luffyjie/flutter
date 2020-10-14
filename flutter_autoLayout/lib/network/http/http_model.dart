// use for service response
import 'package:dio/dio.dart';
import '../http_profile.dart';

class Result {
  var data;
  bool isSuccess;
  int code;
  var headers;

  Result(this.data, this.isSuccess, this.code, {this.headers});
}

Result resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    errorResponse.statusCode = NetworkCode.NETWORK_TIMEOUT;
  }
  return new Result(
      errorResponse.statusMessage, false, errorResponse.statusCode);
}

class Resource {
  String path;
  Map parameters;

  Resource(this.path, this.parameters);
}
