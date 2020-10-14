import 'package:flutter_autoLayout/network/service/http_manager.dart';

import 'http_model.dart';

class Service {
  static request(Resource resource) {
    return HttpManager.getInstance()
        .post(resource.path, parameters: resource.parameters);
  }
}
