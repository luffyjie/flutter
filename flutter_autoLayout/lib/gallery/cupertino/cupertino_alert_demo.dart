import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

enum AlertDemoType {
  alert,
  alertTitle,
  alertButtons,
  alertButtonsOnly,
  actionSheet,
}

class CupertinoAlertDemo extends StatefulWidget {
  @override
  _CupertinoAlertDemoState createState() => _CupertinoAlertDemoState();
}

class _CupertinoAlertDemoState extends State<CupertinoAlertDemo> {
  String lastSelectedValue;

  String _title(BuildContext context, AlertDemoType type) {
    switch (type) {
      case AlertDemoType.alert:
        return AutolayoutLocalizations.of(context).demoCupertinoAlertTitle;
      case AlertDemoType.alertTitle:
        return AutolayoutLocalizations.of(context)
            .demoCupertinoAlertWithTitleTitle;
      case AlertDemoType.alertButtons:
        return AutolayoutLocalizations.of(context)
            .demoCupertinoAlertButtonsTitle;
      case AlertDemoType.alertButtonsOnly:
        return AutolayoutLocalizations.of(context)
            .demoCupertinoAlertButtonsOnlyTitle;
      case AlertDemoType.actionSheet:
        return AutolayoutLocalizations.of(context)
            .demoCupertinoActionSheetTitle;
    }
    return '';
  }

  void _showDemoDialog({BuildContext context, Widget child}) {
    showCupertinoDialog<String>(
      context: context,
      builder: (context) => ApplyTextOptions(child: child),
    ).then((value) {
      if (value != null) {
        setState(() {
          lastSelectedValue = value;
        });
      }
    });
  }

  void _showDemoActionSheet({BuildContext context, Widget child}) {
    child = ApplyTextOptions(
      child: CupertinoTheme(
        data: CupertinoTheme.of(context),
        child: child,
      ),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (context) => child,
    ).then((value) {
      if (value != null) {
        setState(() {
          lastSelectedValue = value;
        });
      }
    });
  }

  void _onAlertPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Text(AutolayoutLocalizations.of(context).dialogDiscardTitle),
        actions: [
          CupertinoDialogAction(
            child:
                Text(AutolayoutLocalizations.of(context).cupertinoAlertDiscard),
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .pop(AutolayoutLocalizations.of(context).cupertinoAlertDiscard),
          ),
          CupertinoDialogAction(
            child:
                Text(AutolayoutLocalizations.of(context).cupertinoAlertCancel),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .pop(AutolayoutLocalizations.of(context).cupertinoAlertCancel),
          ),
        ],
      ),
    );
  }

  void _onAlertWithTitlePress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Text(
            AutolayoutLocalizations.of(context).cupertinoAlertLocationTitle),
        content: Text(AutolayoutLocalizations.of(context)
            .cupertinoAlertLocationDescription),
        actions: [
          CupertinoDialogAction(
            child: Text(
                AutolayoutLocalizations.of(context).cupertinoAlertDontAllow),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertDontAllow),
          ),
          CupertinoDialogAction(
            child:
                Text(AutolayoutLocalizations.of(context).cupertinoAlertAllow),
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .pop(AutolayoutLocalizations.of(context).cupertinoAlertAllow),
          ),
        ],
      ),
    );
  }

  void _onAlertWithButtonsPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: CupertinoDessertDialog(
        title: Text(
          AutolayoutLocalizations.of(context).cupertinoAlertFavoriteDessert,
        ),
        content: Text(
          AutolayoutLocalizations.of(context).cupertinoAlertDessertDescription,
        ),
      ),
    );
  }

  void _onAlertButtonsOnlyPress(BuildContext context) {
    _showDemoDialog(
      context: context,
      child: const CupertinoDessertDialog(),
    );
  }

  void _onActionSheetPress(BuildContext context) {
    _showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(
            AutolayoutLocalizations.of(context).cupertinoAlertFavoriteDessert),
        message: Text(AutolayoutLocalizations.of(context)
            .cupertinoAlertDessertDescription),
        actions: [
          CupertinoActionSheetAction(
            child: Text(
                AutolayoutLocalizations.of(context).cupertinoAlertCheesecake),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertCheesecake),
          ),
          CupertinoActionSheetAction(
            child: Text(
                AutolayoutLocalizations.of(context).cupertinoAlertTiramisu),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertTiramisu),
          ),
          CupertinoActionSheetAction(
            child: Text(
                AutolayoutLocalizations.of(context).cupertinoAlertApplePie),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertApplePie),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(AutolayoutLocalizations.of(context).cupertinoAlertCancel),
          onPressed: () => Navigator.of(context, rootNavigator: true)
              .pop(AutolayoutLocalizations.of(context).cupertinoAlertCancel),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Cupertino Alert'),
      ),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                CupertinoButton.filled(
                  child: Text(_title(context, AlertDemoType.alert)),
                  onPressed: () {
                    _onAlertPress(context);
                  },
                ),
                SizedBox(height: 30),
                CupertinoButton.filled(
                  child: Text(_title(context, AlertDemoType.alertTitle)),
                  onPressed: () {
                    _onAlertWithTitlePress(context);
                  },
                ),
                SizedBox(height: 30),
                CupertinoButton.filled(
                  child: Text(_title(context, AlertDemoType.alertButtons)),
                  onPressed: () {
                    _onAlertWithButtonsPress(context);
                  },
                ),
                SizedBox(height: 30),
                CupertinoButton.filled(
                  child: Text(_title(context, AlertDemoType.alertButtonsOnly)),
                  onPressed: () {
                    _onAlertButtonsOnlyPress(context);
                  },
                ),
                SizedBox(height: 30),
                CupertinoButton.filled(
                  child: Text(_title(context, AlertDemoType.actionSheet)),
                  onPressed: () {
                    _onActionSheetPress(context);
                  },
                ),
                if (lastSelectedValue != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      AutolayoutLocalizations.of(context)
                          .dialogSelectedOption(lastSelectedValue),
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CupertinoDessertDialog extends StatelessWidget {
  const CupertinoDessertDialog({Key key, this.title, this.content})
      : super(key: key);

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: [
        CupertinoDialogAction(
          child: Text(
              AutolayoutLocalizations.of(context).cupertinoAlertCheesecake),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertCheesecake);
          },
        ),
        CupertinoDialogAction(
          child:
              Text(AutolayoutLocalizations.of(context).cupertinoAlertTiramisu),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertTiramisu);
          },
        ),
        CupertinoDialogAction(
          child:
              Text(AutolayoutLocalizations.of(context).cupertinoAlertApplePie),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context).cupertinoAlertApplePie);
          },
        ),
        CupertinoDialogAction(
          child: Text(AutolayoutLocalizations.of(context)
              .cupertinoAlertChocolateBrownie),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(
                AutolayoutLocalizations.of(context)
                    .cupertinoAlertChocolateBrownie);
          },
        ),
        CupertinoDialogAction(
          child: Text(AutolayoutLocalizations.of(context).cupertinoAlertCancel),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop(AutolayoutLocalizations.of(context).cupertinoAlertCancel);
          },
        ),
      ],
    );
  }
}
