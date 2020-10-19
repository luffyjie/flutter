import 'package:flutter_autolayout/public.dart';

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

  bool get isBusy => state == ViewState.busy;

  bool get isIdle => state == ViewState.idle;

  bool get isEmpty => state == ViewState.empty;

  bool get isError => state == ViewState.error;

  void setIdle() {
    Future.delayed(Duration(seconds: 1), () {
      setSate(ViewState.idle);
    });
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
