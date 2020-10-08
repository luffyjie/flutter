import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class CupertinoButtonDemo extends StatelessWidget {
  const CupertinoButtonDemo();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle:
            Text(AutolayoutLocalizations.of(context).demoCupertinoButtonsTitle),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Text(AutolayoutLocalizations.of(context).cupertinoButton),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text(AutolayoutLocalizations.of(context)
                  .cupertinoButtonWithBackground),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
