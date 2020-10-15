import 'package:flutter_autoLayout/public.dart';

class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ViewStateErrorWidget extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final String buttonText;
  final VoidCallback onPressed;

  const ViewStateErrorWidget(
      {Key key,
      @required this.title,
      @required this.message,
      @required this.image,
      this.buttonText,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(Object context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(),
              Container(
                height: 180,
                // color: Colors.red,
                child: Center(
                  child: Image.asset(
                    'assets/view_state/$image.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 25),
          OutlineButton(
            onPressed: () {
              onPressed();
            },
            child: Text(buttonText),
            highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          ),
        ],
      ),
    );
  }
}
