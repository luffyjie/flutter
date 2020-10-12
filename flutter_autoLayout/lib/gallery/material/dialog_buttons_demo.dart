import 'package:flutter_autoLayout/public.dart';

class DialogButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void dismissDialog() {
      Navigator.of(context).pop();
    }

    void showDemoDialog(String message, ButtonStyle style1,
        [ButtonStyle style2]) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: Text(message),
            actions: <Widget>[
              OutlinedButton(
                style: style1,
                onPressed: () {
                  dismissDialog();
                },
                child: Text('Approve'),
              ),
              OutlinedButton(
                style: style2 ?? style1,
                onPressed: () {
                  dismissDialog();
                },
                child: Text('Really Approve'),
              ),
            ],
          );
        },
      );
    }

    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          onPressed: () {
            showDemoDialog(
              'Stadium shaped action buttons, default ouline.',
              OutlinedButton.styleFrom(shape: StadiumBorder()),
            );
          },
          child: Text('Show an AlertDialog'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showDemoDialog(
              'One Stadium shaped action button, with a heavy, primary color '
              'outline.',
              OutlinedButton.styleFrom(shape: StadiumBorder()),
              OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          },
          child: Text('Show another AlertDialog'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showDemoDialog(
              'Stadium shaped action buttons, with a heavy, primary color '
              'outline when the button is focused or hovered',
              OutlinedButton.styleFrom(
                shape: StadiumBorder(),
              ).copyWith(side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.focused)) {
                    return BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  }
                  return null; // defer to the default
                },
              )),
            );
          },
          child: Text('Show yet another AlertDialog'),
        ),
      ]),
    );
  }
}

class IndividuallySizedButtons extends StatefulWidget {
  @override
  _IndividuallySizedButtonsState createState() =>
      _IndividuallySizedButtonsState();
}

class _IndividuallySizedButtonsState extends State<IndividuallySizedButtons> {
  bool _textButtonFlag = false;
  bool _containedButtonFlag = false;
  bool _outlinedButtonFlag = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const Widget spacer = SizedBox(height: 16);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          spacer,
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  _textButtonFlag ? textTheme.headline2 : textTheme.headline4,
            ),
            onPressed: () {
              setState(() {
                _textButtonFlag = !_textButtonFlag;
              });
            },
            child: Text('TEXT'),
          ),
          spacer,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: _containedButtonFlag
                  ? textTheme.headline2
                  : textTheme.headline4,
            ),
            onPressed: () {
              setState(() {
                _containedButtonFlag = !_containedButtonFlag;
              });
            },
            child: Text('CONTAINED'),
          ),
          spacer,
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              textStyle: _outlinedButtonFlag
                  ? textTheme.headline2
                  : textTheme.headline4,
            ),
            onPressed: () {
              setState(() {
                _outlinedButtonFlag = !_outlinedButtonFlag;
              });
            },
            child: Text('OUTLINED'),
          ),
          spacer,
        ],
      ),
    );
  }
}

class ShapeButtons extends StatefulWidget {
  @override
  _ShapeButtonsState createState() => _ShapeButtonsState();
}

class _ShapeButtonsState extends State<ShapeButtons> {
  int shapeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<ShapeBorder> buttonShapes = <ShapeBorder>[
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      StadiumBorder(),
    ];

    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(shape: buttonShapes[shapeIndex]),
      ),
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(shape: buttonShapes[shapeIndex]),
        ),
        child: OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(shape: buttonShapes[shapeIndex]),
          ),
          child: OverflowBox(
            maxWidth: double.infinity,
            child: DefaultButtons(
              onPressed: () {
                setState(() {
                  shapeIndex = (shapeIndex + 1) % buttonShapes.length;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TextStyleButtons extends StatefulWidget {
  @override
  _TextStyleButtonsState createState() => _TextStyleButtonsState();
}

class _TextStyleButtonsState extends State<TextStyleButtons> {
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle style = _flag ? textTheme.headline1 : textTheme.headline4;
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: style),
      ),
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(textStyle: style),
        ),
        child: OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(textStyle: style),
          ),
          child: OverflowBox(
            maxWidth: double.infinity,
            child: DefaultButtons(
              iconSize: _flag ? 64 : 24,
              onPressed: () {
                setState(() {
                  _flag = !_flag;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TextColorButtons extends StatefulWidget {
  @override
  _TextColorButtonsState createState() => _TextColorButtonsState();
}

class _TextColorButtonsState extends State<TextColorButtons> {
  int index = 0;

  static const List<Color> foregroundColors = <Color>[
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.teal,
    Colors.lime,
    Colors.deepOrange,
    Colors.yellow,
  ];

  static const List<Color> backgroundColors = <Color>[
    Colors.lightBlue,
    Colors.yellow,
    Colors.grey,
    Colors.amber,
    Colors.orange,
    Colors.blue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = foregroundColors[index];
    final Color backgroundColor = backgroundColors[index];
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(primary: foregroundColor),
      ),
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            onPrimary: foregroundColor,
          ),
        ),
        child: OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: TextButton.styleFrom(primary: foregroundColor),
          ),
          child: DefaultButtons(
            onPressed: () {
              setState(() {
                index = (index + 1) % foregroundColors.length;
              });
            },
          ),
        ),
      ),
    );
  }
}

class DefaultButtons extends StatelessWidget {
  const DefaultButtons({Key key, this.onPressed, this.iconSize = 18})
      : super(key: key);

  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    const Widget spacer = SizedBox(height: 4);
    final Widget icon = Icon(Icons.star, size: iconSize);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: onPressed ?? () {},
            child: Text('TEXT'),
          ),
          spacer,
          TextButton.icon(
            onPressed: onPressed ?? () {},
            icon: icon,
            label: Text('TEXT'),
          ),
          spacer,
          TextButton.icon(
            onPressed: null,
            icon: icon,
            label: Text('DISABLED'),
          ),
          spacer,
          ElevatedButton(
            onPressed: onPressed ?? () {},
            child: Text('CONTAINED'),
          ),
          spacer,
          ElevatedButton.icon(
            onPressed: onPressed ?? () {},
            icon: icon,
            label: Text('CONTAINED'),
          ),
          spacer,
          ElevatedButton.icon(
            onPressed: null,
            icon: icon,
            label: Text('DISABLED'),
          ),
          spacer,
          OutlinedButton(
            onPressed: onPressed ?? () {},
            child: Text('OUTLINED'),
          ),
          OutlinedButton.icon(
            onPressed: onPressed ?? () {},
            icon: icon,
            label: Text('OUTLINED'),
          ),
          spacer,
          OutlinedButton.icon(
            onPressed: null,
            icon: icon,
            label: Text('DISABLED'),
          ),
          spacer,
        ],
      ),
    );
  }
}

class _ButtonDemo {
  const _ButtonDemo({Key key, this.title, this.description, this.builder});

  final String title;
  final String description;
  final WidgetBuilder builder;
}

final List<_ButtonDemo> allButtonDemos = <_ButtonDemo>[
  _ButtonDemo(
    title: 'Default Buttons',
    description:
        'Enabled and disabled buttons in their default configurations.',
    builder: (BuildContext context) => DefaultButtons(),
  ),
  _ButtonDemo(
    title: 'TextColor Buttons',
    description:
        'Use TextButtonTheme, ElevatedButtonTheme, OutlinedButtonTheme to '
        'override the text color of all buttons. The background color for '
        'ElevatedButtons does not change.',
    builder: (BuildContext context) => TextColorButtons(),
  ),
  _ButtonDemo(
    title: 'TextStyle Buttons',
    description:
        'Use TextButtonTheme, ElevatedButtonTheme, OutlinedButtonTheme to override '
        'the default text style of the buttons. Press any button to toggle the text '
        'style size to an even bigger value.',
    builder: (BuildContext context) => TextStyleButtons(),
  ),
  _ButtonDemo(
    title: 'Individually Sized  Buttons',
    description:
        'Sets the ButtonStyle parameter of individual buttons to override their '
        'default text style/ Press any button to toggle its text text style size.',
    builder: (BuildContext context) => IndividuallySizedButtons(),
  ),
  _ButtonDemo(
    title: 'Button Shapes',
    description:
        'Use TextButtonTheme, ElevatedButtonTheme, OutlinedButtonTheme to '
        'override the shape all buttons.',
    builder: (BuildContext context) => ShapeButtons(),
  ),
  _ButtonDemo(
    title: 'Dialog Buttons',
    description:
        'Use ButtonStyle to configure the shape of a dialog\'s action buttons.',
    builder: (BuildContext context) => DialogButtons(),
  ),
];

class DilogButtonsDemo extends StatefulWidget {
  const DilogButtonsDemo({Key key, this.toggleThemeMode}) : super(key: key);

  final VoidCallback toggleThemeMode;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DilogButtonsDemo> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _pageController.addListener(pageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void pageChanged() {
    if (_pageController.hasClients) {
      setState(() {
        _currentPage = _pageController.page.floor();
      });
    }
  }

  void changePage(int delta) {
    if (_pageController.hasClients) {
      const Duration duration = Duration(milliseconds: 300);
      _pageController.animateToPage(_currentPage + delta,
          duration: duration, curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle actionButtonStyle = TextButton.styleFrom(
      primary: colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(allButtonDemos[_currentPage].title,
            style: TextStyle(color: colorScheme.onPrimary)),
        backgroundColor: colorScheme.primary,
        actions: <Widget>[
          TextButton(
            style: actionButtonStyle,
            onPressed: widget.toggleThemeMode,
            child: Icon(Icons.stars),
          ),
          TextButton(
            style: actionButtonStyle,
            onPressed: () {
              changePage(-1);
            },
            child: Icon(Icons.arrow_back),
          ),
          TextButton(
            style: actionButtonStyle,
            onPressed: () {
              changePage(1);
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Container(
              height: 98,
              color: colorScheme.onSurface.withOpacity(0.1),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  allButtonDemos[_currentPage].description,
                  maxLines: 4,
                  style:
                      TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: allButtonDemos.length,
              itemBuilder: (BuildContext context, int index) {
                return allButtonDemos[index].builder(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
