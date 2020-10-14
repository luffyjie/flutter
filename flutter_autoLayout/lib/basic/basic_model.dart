import 'package:flutter_autoLayout/public.dart';

class BaseModel extends ChangeNotifier {
  bool disposed = false;

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setSate(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  void setIdle() {
    setSate(ViewState.idle);
  }

  void setBusy() {
    setSate(ViewState.busy);
  }

  void setEmpty() {
    setSate(ViewState.empty);
  }

  void setError() {
    setSate(ViewState.error);
  }
}
