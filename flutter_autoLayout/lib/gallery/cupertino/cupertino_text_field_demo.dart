import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class CupertinoTextFieldDemo extends StatelessWidget {
  const CupertinoTextFieldDemo();

  @override
  Widget build(BuildContext context) {
    final localizations = AutolayoutLocalizations.of(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(localizations.demoCupertinoTextFieldTitle),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: localizations.demoTextFieldEmail,
                keyboardType: TextInputType.emailAddress,
                clearButtonMode: OverlayVisibilityMode.editing,
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: localizations.rallyLoginPassword,
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                autocorrect: false,
              ),
            ),
            CupertinoTextField(
              prefix: const Icon(
                CupertinoIcons.padlock_solid,
                color: Colors.black,
                size: 28,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.number,
              decoration: const BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 0, color: CupertinoColors.inactiveGray),
                ),
              ),
              placeholder: localizations.demoCupertinoTextFieldPIN,
            ),
          ],
        ),
      ),
    );
  }
}
