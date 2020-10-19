import 'package:flutter_autolayout/public.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

/// Globale consitant

enum CustomtextDirection {
  localeBased,
  ltr,
  rtl,
}

const List<String> rtlLanguages = <String>[
  'ar',
  'fa',
  'he',
  'ps',
  'ur',
];

Locale _deviceLocale;
Locale get deviceLocale => _deviceLocale;
set deviceLocale(Locale locale) {
  _deviceLocale ??= locale;
}

class ApplicationOptions {
  const ApplicationOptions({
    this.themeMode,
    double textScaleFactor,
    this.customtextDirection,
    Locale locale,
    this.timeDilation,
    this.platform,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode themeMode;
  final double _textScaleFactor;
  final double timeDilation;
  final CustomtextDirection customtextDirection;
  final Locale _locale;
  final TargetPlatform platform;

  double textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale get locale => _locale ?? deviceLocale;

  TextDirection resolvedTextDirection() {
    switch (customtextDirection) {
      case CustomtextDirection.localeBased:
        final language = locale?.languageCode?.toLowerCase();
        if (language == null) return null;
        return rtlLanguages.contains(language)
            ? TextDirection.rtl
            : TextDirection.ltr;
      case CustomtextDirection.rtl:
        return TextDirection.rtl;
      default:
        return TextDirection.ltr;
    }
  }

  SystemUiOverlayStyle resolvedSystemUiOverlaystyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance.window.platformBrightness;
    }

    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  ApplicationOptions copyWith({
    ThemeMode themeMode,
    double textScaleFactor,
    CustomtextDirection customtextDirection,
    Locale locale,
    double timeDilation,
    TargetPlatform platform,
  }) {
    return ApplicationOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      customtextDirection: customtextDirection ?? this.customtextDirection,
      locale: locale ?? this.locale,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
    );
  }

  static ApplicationOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, ApplicationOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = ApplicationOptions.of(context);
    final textDirection = options.resolvedTextDirection();
    final textScaleFactor = options.textScaleFactor(context);

    Widget widget = MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );

    return textDirection == null
        ? widget
        : Directionality(
            textDirection: textDirection,
            child: widget,
          );
  }
}

class _ModelBindingScope extends InheritedWidget {
  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key key,
    this.initialModel = const ApplicationOptions(),
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final ApplicationOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  ApplicationOptions currentModel;
  Timer _timeDilationTime;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    _timeDilationTime?.cancel();
    _timeDilationTime = null;
    super.dispose();
  }

  void handleTimeDilation(ApplicationOptions newModel) {
    if (currentModel.timeDilation != newModel.timeDilation) {
      _timeDilationTime?.cancel();
      _timeDilationTime = null;
      if (newModel.timeDilation > 1) {
        _timeDilationTime = Timer(const Duration(milliseconds: 150), () {
          timeDilation = newModel.timeDilation;
        });
      } else {
        timeDilation = newModel.timeDilation;
      }
    }
  }

  void updateModel(ApplicationOptions newModel) {
    if (newModel != currentModel) {
      handleTimeDilation(newModel);
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
