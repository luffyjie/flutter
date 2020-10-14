import 'dart:collection';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

class DataHelper {
  static SplayTreeMap getBaseMap() {
    var map = SplayTreeMap<String, dynamic>();
    map['platform'] = '1';
    map['version'] = '1.0.0';
    map['time'] = DateTime.now().microsecondsSinceEpoch.toString();
    return map;
  }

  static encryptParameters(Map<String, dynamic> map) {
    var buffer = StringBuffer();
    map.forEach((key, value) {
      buffer.write(key);
      buffer.write(value);
    });

    buffer.write("SERECT");
    print('bustring--->:' + buffer.toString());
    var sign = string2MD5(buffer.toString());
    map["sign"] = sign;
    print("sign--->" + sign);
    return map;
  }

  static string2MD5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
