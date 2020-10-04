import 'package:flutter_autoLayout/public.dart';

enum ListDemoType {
  onLine,
  twoLine,
}

class ListDemo extends StatelessWidget {
  const ListDemo({Key key, this.type}) : super(key: key);

  final ListDemoType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoListsTitle),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (var i = 0; i < 21; i++)
              ListTile(
                leading: ExcludeSemantics(
                  child: CircleAvatar(
                    child: Text('$i'),
                  ),
                ),
                title: Text(
                    AutolayoutLocalizations.of(context).demoBottomSheetItem(i)),
                subtitle: type == ListDemoType.twoLine
                    ? Text(
                        AutolayoutLocalizations.of(context).demoListsSecondary)
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
