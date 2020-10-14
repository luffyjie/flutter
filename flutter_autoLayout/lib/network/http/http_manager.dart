import 'package:dio/dio.dart';
import 'http_profile.dart';
import 'http_interceptor.dart';
import 'response_interceptor.dart';
import 'http_model.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();

  Dio _dio;

  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;

  factory HttpManager() => _instance;

  HttpManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? HttpProfile().apiDomain,
          connectTimeout: 15000,
        ),
      );
      _dio.interceptors.add(DioLogInterceptor());
      _dio.interceptors.add(ResponseInterceptors());
    }
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    }
    return _instance._baseUrl(baseUrl);
  }

  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != HttpProfile().apiDomain) {
        _dio.options.baseUrl = HttpProfile().apiDomain;
      }
    }
    return this;
  }

  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  // GET
  get(api, {parameters}) async {
    Response response;
    try {
      response = await _dio.get(api, queryParameters: parameters);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;
  }

  //POST
  post(api, {parameters}) async {
    Response response;

    try {
      response = await _dio.post(api, data: parameters);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;
  }
}
