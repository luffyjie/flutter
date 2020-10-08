import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class CupertinoProgressIndicatorDemo extends StatelessWidget {
  const CupertinoProgressIndicatorDemo();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(AutolayoutLocalizations.of(context)
            .demoCupertinoActivityIndicatorTitle),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
