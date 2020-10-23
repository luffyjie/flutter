import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_autolayout/public.dart';
import 'package:oktoast/oktoast.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final options = ApplicationOptions.of(context);
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [SizedBox.shrink()],
            backgroundColor: theme.background,
            expandedHeight: 100 + MediaQuery.of(context).padding.top,
            flexibleSpace: UserHeaderWidget(),
            pinned: false,
            automaticallyImplyLeading: false,
          ),
          FutureListWidget(),
        ],
      ),
    );
  }
}

class UserHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 25, bottom: 35),
          height: 50,
          child: Row(
            children: [
              Icon(
                Icons.account_circle_sharp,
                color: theme.primary,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('+8692282827'),
                  Icon(
                    Icons.error,
                    color: theme.error,
                    size: 18,
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FutureListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final options = ApplicationOptions.of(context);
    return ListTileTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              color: Styles.sectionBackground,
              child: SizedBox(
                height: 10,
              ),
            ),
            ListTile(
              title: Text(
                AutolayoutLocalizations.of(context).darkMode,
                style: TextStyle(color: theme.onBackground),
              ),
              onTap: () {
                switchDarkModel(context);
              },
              leading: Transform.rotate(
                angle: -pi,
                child: Icon(
                  theme.brightness == Brightness.light
                      ? Icons.brightness_5
                      : Icons.brightness_2,
                  color: theme.primary,
                ),
              ),
              trailing: CupertinoSwitch(
                activeColor: theme.primary,
                value:
                    ApplicationOptions.of(context).themeMode == ThemeMode.dark,
                onChanged: (value) {
                  switchDarkModel(context);
                },
              ),
            ),
            SettingThemeWidget(),
            ListTile(
              title: Text(
                AutolayoutLocalizations.of(context).setting,
                style: TextStyle(color: theme.onBackground),
              ),
              onTap: () {
                Application.push(context, '/user/setting');
              },
              leading: Icon(
                Icons.settings,
                color: theme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void switchDarkModel(BuildContext context) {
    showToast("切换模式完成", position: ToastPosition.center);
    final isCurrentDark =
        ApplicationOptions.of(context).themeMode == ThemeMode.dark
            ? true
            : false;
    ApplicationOptions.update(
      context,
      ApplicationOptions.of(context).copyWith(
        themeMode: isCurrentDark ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }
}

class SettingThemeWidget extends StatelessWidget {
  @override
  Widget build(Object context) {
    return ExpansionTile(
      title: Text(
        AutolayoutLocalizations.of(context).theme,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      leading: Icon(
        Icons.color_lens,
        color: Theme.of(context).colorScheme.primary,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              ...Colors.primaries.map(
                (color) {
                  return Material(
                    color: color,
                    child: InkWell(
                      onTap: () {
                        ApplicationOptions.update(
                          context,
                          ApplicationOptions.of(context)
                              .copyWith(themeColor: color),
                        );
                      },
                      child: Container(width: 40, height: 40),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
