import 'package:flutter_autoLayout/public.dart';

enum ProgressIndicatorDemoType {
  circular,
  linear,
}

class ProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressIndicatorDemoState createState() => _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
      reverseCurve: Curves.fastOutSlowIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  String _title(ProgressIndicatorDemoType type) {
    switch (type) {
      case ProgressIndicatorDemoType.circular:
        return AutolayoutLocalizations.of(context)
            .demoCircularProgressIndicatorTitle;
      case ProgressIndicatorDemoType.linear:
        return AutolayoutLocalizations.of(context)
            .demoLinearProgressIndicatorTitle;
    }
    return '';
  }

  Widget _builCircularIndicator(BuildContext context, Widget child) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(_title(ProgressIndicatorDemoType.circular)),
        SizedBox(height: 20),
        const CircularProgressIndicator(),
        const SizedBox(height: 32),
        CircularProgressIndicator(value: _animation.value),
      ],
    );
  }

  Widget _buildLineIndicator(BuildContext context, Widget child) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(_title(ProgressIndicatorDemoType.circular)),
        SizedBox(height: 20),
        const LinearProgressIndicator(),
        const SizedBox(height: 32),
        LinearProgressIndicator(value: _animation.value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Progress indicator'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: AnimatedBuilder(
                animation: _animation,
                builder: _builCircularIndicator,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: AnimatedBuilder(
                animation: _animation,
                builder: _buildLineIndicator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
