import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class CupertinoNavigationBarDemo extends StatelessWidget {
  const CupertinoNavigationBarDemo();

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (settings) {
      return _NoAnimationCupertinoPageRoute<void>(
        title:
            AutolayoutLocalizations.of(context).demoCupertinoNavigationBarTitle,
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  automaticallyImplyLeading: false,
                ),
                SliverPadding(
                  padding: MediaQuery.of(context)
                      .removePadding(removeTop: true)
                      .padding,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final title = AutolayoutLocalizations.of(context)
                            .starterAppDrawerItem(index + 1);
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute<void>(
                              title: title,
                              builder: (context) => _SecondPage(),
                            ));
                          },
                          title: Text(title),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Container(),
    );
  }
}

class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  _NoAnimationCupertinoPageRoute({
    @required WidgetBuilder builder,
    String title,
  }) : super(builder: builder, title: title);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryanimation,
    Widget child,
  ) {
    return child;
  }
}
