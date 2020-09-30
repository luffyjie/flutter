import 'package:flutter_autoLayout/public.dart';

class GalleryButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const GalleryButton({Key key, this.name, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(name,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
        color: Color(0xEC17BFEF),
        onPressed: onPressed);
  }
}
