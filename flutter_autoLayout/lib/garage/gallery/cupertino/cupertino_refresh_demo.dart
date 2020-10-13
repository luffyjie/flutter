import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';
import 'dart:math' show Random;

class CupertinoRefreshControlDemo extends StatefulWidget {
  const CupertinoRefreshControlDemo();

  @override
  _CupertinoRefreshControlDemoState createState() =>
      _CupertinoRefreshControlDemoState();
}

class _CupertinoRefreshControlDemoState
    extends State<CupertinoRefreshControlDemo> {
  static const listCount = 20;
  var randomList = List<int>.generate(listCount, (i) => i + 1);

  void _shuffleList() => randomList.shuffle(Random());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              largeTitle: Text(AutolayoutLocalizations.of(context)
                  .demoCupertinoPullToRefreshTitle),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 1),
                )..then<void>((_) {
                    if (mounted) {
                      setState(() {
                        _shuffleList();
                      });
                    }
                  });
              },
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final title = AutolayoutLocalizations.of(context)
                      .starterAppDrawerItem(randomList[index]);
                  return ListTile(title: Text(title));
                },
                childCount: listCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
