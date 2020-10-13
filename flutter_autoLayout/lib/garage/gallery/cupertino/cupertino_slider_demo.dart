import 'package:flutter/cupertino.dart';
import 'package:flutter_autoLayout/public.dart';

class CupertinoSliderDemo extends StatefulWidget {
  const CupertinoSliderDemo();

  @override
  _CupertinoSliderDemoState createState() => _CupertinoSliderDemoState();
}

class _CupertinoSliderDemoState extends State<CupertinoSliderDemo> {
  double _value = 25.0;
  double _discreteValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle:
              Text(AutolayoutLocalizations.of(context).demoCustomSlidersTitle),
        ),
        child: DefaultTextStyle(
          style: CupertinoTheme.of(context).textTheme.textStyle,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlider(
                        value: _value,
                        min: 0.0,
                        max: 100.0,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                    MergeSemantics(
                      child: Text(
                        AutolayoutLocalizations.of(context)
                            .demoCupertinoSliderContinuous(
                          _value.toStringAsFixed(1),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlider(
                          value: _discreteValue,
                          min: 0.0,
                          max: 100.0,
                          divisions: 5,
                          onChanged: (value) {
                            setState(() {
                              _discreteValue = value;
                            });
                          }),
                    ),
                    MergeSemantics(
                      child: Text(
                        AutolayoutLocalizations.of(context)
                            .demoCupertinoSliderDiscrete(
                          _discreteValue.toStringAsFixed(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
