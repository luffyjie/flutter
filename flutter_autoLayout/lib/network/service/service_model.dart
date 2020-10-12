// use for service response
class Result {
  int code;
  dynamic data;
  String message;

  Result({this.code, this.data, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int;
    data = json['data'];
    message = json['message'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = data;
    data['message'] = message;
    return data;
  }
}

class Resource {
  String path;
  Map parameters;

  Resource(String listPath, this.parameters);

  String get url {
    return path;
  }

  Map get encryptedParameters {
    return parameters;
  }
}
