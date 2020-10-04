import 'package:flutter_autoLayout/public.dart';

enum DialogDemoType {
  alert,
  alertTitle,
  simple,
  fullscreen,
}

class DialogDemo extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title(BuildContext context, DialogDemoType type) {
    switch (type) {
      case DialogDemoType.alert:
        return AutolayoutLocalizations.of(context).demoAlertDialogTitle;
      case DialogDemoType.alertTitle:
        return AutolayoutLocalizations.of(context).demoAlertTitleDialogTitle;
      case DialogDemoType.simple:
        return AutolayoutLocalizations.of(context).demoSimpleDialogTitle;
      case DialogDemoType.fullscreen:
        return AutolayoutLocalizations.of(context).demoFullscreenDialogTitle;
    }
    return '';
  }

  Future<void> _showDemoDialog<T>({BuildContext context, Widget child}) async {
    child = ApplyTextOptions(
      child: Theme(
        data: Theme.of(context),
        child: child,
      ),
    );
    final value = await showDialog<T>(
      context: context,
      builder: (context) => child,
    );
    if (value != null && value is String) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            AutolayoutLocalizations.of(context).dialogSelectedOption(value)),
      ));
    }
  }

  void _showAlertDialog(BuildContext context) {
    final theme = Theme.of(context);
    final dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);
    _showDemoDialog<String>(
      context: context,
      child: AlertDialog(
        content: Text(
          AutolayoutLocalizations.of(context).dialogDiscardTitle,
          style: dialogTextStyle,
        ),
        actions: [
          _DialogButton(
            text: AutolayoutLocalizations.of(context).dialogCancel,
          ),
          _DialogButton(
            text: AutolayoutLocalizations.of(context).dialogDiscard,
          ),
        ],
      ),
    );
  }

  void _showAlertDialogWithTitle(BuildContext context) {
    final theme = Theme.of(context);
    final dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);
    _showDemoDialog<String>(
      context: context,
      child: AlertDialog(
        title: Text(AutolayoutLocalizations.of(context).dialogLocationTitle),
        content: Text(
          AutolayoutLocalizations.of(context).dialogLocationTitle,
          style: dialogTextStyle,
        ),
        actions: [
          _DialogButton(
            text: AutolayoutLocalizations.of(context).dialogDisagree,
          ),
          _DialogButton(
            text: AutolayoutLocalizations.of(context).dialogAgree,
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    final theme = Theme.of(context);
    _showDemoDialog<String>(
        context: context,
        child: SimpleDialog(
          title: Text(AutolayoutLocalizations.of(context).dialogSetBackup),
          children: [
            _DialogDemoItem(
              icon: Icons.account_circle,
              color: theme.colorScheme.primary,
              text: 'username@gmail.com',
            ),
            _DialogDemoItem(
              icon: Icons.account_circle,
              color: theme.colorScheme.secondary,
              text: 'user02@gamil.com',
            ),
            _DialogDemoItem(
              icon: Icons.add_circle,
              text: AutolayoutLocalizations.of(context).dialogAddAccount,
              color: theme.disabledColor,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return _NoAnimationMaterialPageRoute<void>(
          builder: (context) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Dialog'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                    child: Text(_title(context, DialogDemoType.alert)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _showAlertDialogWithTitle(context);
                    },
                    child: Text(_title(context, DialogDemoType.alertTitle)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _showSimpleDialog(context);
                    },
                    child: Text(_title(context, DialogDemoType.simple)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _FullScreenDialogDemo(),
                            fullscreenDialog: true),
                      );
                    },
                    child: Text(_title(context, DialogDemoType.fullscreen)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(text);
      },
      child: Text(text),
    );
  }
}

class _DialogDemoItem extends StatelessWidget {
  const _DialogDemoItem({
    Key key,
    this.icon,
    this.color,
    this.text,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(text);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullScreenDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: ApplyTextOptions(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                  AutolayoutLocalizations.of(context).dialogFullscreenTitle),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AutolayoutLocalizations.of(context).dialogFullscreenSave,
                    style: theme.textTheme.bodyText2
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Text(AutolayoutLocalizations.of(context)
                  .dialogFullscreenDescription),
            ),
          ),
        ));
  }
}
