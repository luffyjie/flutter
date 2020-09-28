import 'package:flutter/services.dart';

const MethodChannel _channel =
    const MethodChannel('com.sankuai.waimai/network');
Future<Map<String, dynamic>> post(String path,
    [Map<String, dynamic> form]) async {
  return _channel
      .invokeMethod("post", {'path': path, 'paramaters': form}).then((result) {
    return new Map<String, dynamic>.from(result);
  }).catchError((_) => null);
}
