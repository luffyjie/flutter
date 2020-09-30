import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/autolayout_localizations.dart';

enum BannerDemoAction {
  rest,
  showMultipleActions,
  showLeading,
}

class BannerDemo extends StatefulWidget {
  const BannerDemo();

  @override
  _BannerDemoState createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  static const _itemCount = 20;
  var _displayBanner = true;
  var _showMultipleActions = true;
  var _showLeading = true;

  void handleDemoAction(BannerDemoAction action) {
    setState(() {
      switch (action) {
        case BannerDemoAction.rest:
          _displayBanner = true;
          _showMultipleActions = true;
          _showLeading = true;
          break;
        case BannerDemoAction.showMultipleActions:
          _showMultipleActions = true;
          break;
        case BannerDemoAction.showLeading:
          _showLeading = !_showLeading;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final banner = MaterialBanner(
      content: Text(AutolayoutLocalizations.of(context).bannerDemoText),
      leading: _showLeading
          ? CircleAvatar(
              child: Icon(
                Icons.access_alarm,
                color: colorScheme.onPrimary,
              ),
            )
          : null,
      actions: [
        FlatButton(
            onPressed: () {},
            child: Text(AutolayoutLocalizations.of(context).signIn)),
        if (_showMultipleActions)
          FlatButton(
              onPressed: () {
                setState(() {
                  _displayBanner = false;
                });
              },
              child: Text(AutolayoutLocalizations.of(context).dismiss))
      ],
      backgroundColor: colorScheme.background,
    );
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text(AutolayoutLocalizations.of(context).demoBannerTitle),
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          trailing: IconButton(
            icon: Icon(
              CupertinoIcons.info,
            ),
            onPressed: () {
              PopupMenuButton<BannerDemoAction>(
                onSelected: handleDemoAction,
                itemBuilder: (context) => <PopupMenuEntry<BannerDemoAction>>[
                  PopupMenuItem<BannerDemoAction>(
                    child: Text(AutolayoutLocalizations.of(context)
                        .bannerDemoResetText),
                    value: BannerDemoAction.rest,
                  ),
                  const PopupMenuDivider(),
                  CheckedPopupMenuItem<BannerDemoAction>(
                    value: BannerDemoAction.showMultipleActions,
                    checked: _showMultipleActions,
                    child: Text(AutolayoutLocalizations.of(context)
                        .bannerDemoMultipleText),
                  ),
                  CheckedPopupMenuItem<BannerDemoAction>(
                    value: BannerDemoAction.showLeading,
                    checked: _showLeading,
                    child: Text(AutolayoutLocalizations.of(context)
                        .bannerDemoLeadingText),
                  )
                ],
              );
            },
          ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: _displayBanner ? _itemCount + 1 : _itemCount,
                    itemBuilder: (context, index) {
                      if (index == 0 && _displayBanner) return banner;
                      return ListTile(
                        title: Text(AutolayoutLocalizations.of(context)
                            .starterAppDrawerItem(
                                _displayBanner ? index : index + 1)),
                      );
                    }))
          ],
        )),
      ),
    );
  }
}
