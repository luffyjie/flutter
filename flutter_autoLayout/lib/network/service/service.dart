import 'package:dio/dio.dart';
import 'service_model.dart';

class Service {
  // final _encryptInterfaceList = ["/api/v1/recharge/rechargePayEncrypt"];

  List<int> _acceptableStatusCodes() {
    var list = List<int>();
    for (int i = 200; i < 300; i++) {
      list.add(i);
    }
    return list;
  }

  Dio _dio() => Dio()
    ..options = BaseOptions(
      connectTimeout: 60,
      receiveTimeout: 60,
    );

  Future<Result> _post(Resource resource) async {
    final response =
        await _dio().post(resource.url, queryParameters: resource.parameters);
    final acceptList = _acceptableStatusCodes();
    if (acceptList.contains(response.statusCode)) {
      return Result.fromJson(response.data);
    }
    return Result(
      code: 500,
      message:
          'Sorry, we are having some temporary server issue. Please try again later. ',
    );
  }

  Stream<Result> request(Resource resource) =>
      Stream.fromFuture(_post(resource));
}
