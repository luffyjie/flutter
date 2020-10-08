import 'package:flutter_autoLayout/public.dart';

class SnackbarsDemo extends StatelessWidget {
  const SnackbarsDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoSnackbarsTitle),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: RaisedButton(
              child: Text(
                  AutolayoutLocalizations.of(context).demoSnackbarsButtonLabel),
              onPressed: () {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        AutolayoutLocalizations.of(context).demoSnackbarsText),
                    action: SnackBarAction(
                      label: AutolayoutLocalizations.of(context)
                          .demoSnackbarsActionButtonLabel,
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AutolayoutLocalizations.of(context)
                                .demoSnackbarsAction),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
