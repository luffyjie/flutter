import 'http/http_manager.dart';
import 'http/http_model.dart';

class Service {
  static request(Resource resource) {
    return HttpManager.getInstance()
        .post(resource.path, parameters: resource.parameters);
  }
}
