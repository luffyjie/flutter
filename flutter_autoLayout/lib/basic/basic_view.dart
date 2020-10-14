import 'package:flutter_autoLayout/public.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;

  final T model;
  final Widget child;
  final Function(T) onModelReady;

  const BaseView(
      {Key key, this.builder, this.model, this.onModelReady, this.child})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model;
      },
    );
  }
}
