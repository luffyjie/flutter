import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_autolayout/public.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with TickerProviderStateMixin {
  AnimationController _countdownController;

  @override
  void initState() {
    _countdownController = AnimationController(
      value: 0,
      vsync: this,
      duration: Duration(
        seconds: 10,
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
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 10,
              top: 10,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    _nextPage(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withAlpha(100),
                    ),
                    child: AnimatedCountdown(
                      context: context,
                      animation: StepTween(begin: 9, end: 0)
                          .animate(_countdownController),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Image.asset(
                ImageHelper.assertIcon('login_logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _nextPage(BuildContext context) {
  Application.push(context, Routes.tab);
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value | ') +
          AutolayoutLocalizations.of(context).launchSkip,
      style: TextStyle(color: Colors.white),
    );
  }
}
