import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _countdownController;

  @override
  void initState() {
    print('Launch Start');
    _countdownController = AnimationController(
      value: 0,
      vsync: this,
      duration: Duration(
        seconds: 4,
      ),
    );
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Launch Page',
              style: TextStyle(
                color: Colors.red,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              _nextPage(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: EdgeInsets.only(right: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withAlpha(100),
              ),
              child: AnimatedCountdown(
                context: context,
                animation:
                    StepTween(begin: 3, end: 0).animate(_countdownController),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Garage App'),
            onPressed: () {
              Navigator.pushNamed(context, '/garage');
            },
          ),
        ],
      ),
    );
  }
}

void _nextPage(BuildContext context) {
  Application.router.navigateTo(context, '/tab');
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _nextPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value | ') + 'skip',
      style: TextStyle(color: Colors.white),
    );
  }
}
