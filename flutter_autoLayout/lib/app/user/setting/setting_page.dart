import 'package:flutter_autolayout/public.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AutolayoutLocalizations.of(context).setting),
      ),
      body: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 10),
              Material(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Text(AutolayoutLocalizations.of(context).font),
                    ],
                  ),
                  leading: Icon(
                    Icons.font_download,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: fontValueList.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          onChanged: (index) {},
                          groupValue: 1,
                          title: Text(fontValueList[index]),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AutolayoutLocalizations.of(context).language,
                      ),
                      Text('data'),
                    ],
                  ),
                  leading: Icon(
                    Icons.public,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: supportLanguages.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          onChanged: (index) {},
                          groupValue: 1,
                          title: Text(
                            ApplicationOptions.localName(index, context),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text(AutolayoutLocalizations.of(context).update),
                  leading: Icon(
                    Icons.system_update,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
