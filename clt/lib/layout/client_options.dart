import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:clt/constants.dart';

enum CustomTextDirection {
  localeBased,
  ltr,
  rtl,
}

const systemLocaleOption = Locale('system');

Locale? _deviceLocale;
Locale? get deviceLocale => _deviceLocale;
set deviceLocale(Locale? locale) {
  _deviceLocale ??= locale;
}

class ClientOptions {
  const ClientOptions(
      {this.themeMode,
      double? textScaleFactor,
      this.customTextDirection,
      Locale? locale,
      required this.timeDilation,
      this.platform,
      this.isTestMode})
      : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode? themeMode;
  final double? _textScaleFactor;
  final CustomTextDirection? customTextDirection;
  final Locale? _locale;
  final double timeDilation;
  final TargetPlatform? platform;
  final bool? isTestMode;

  double? textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale? get locale => _locale ?? deviceLocale;

  TextDirection? resolvedTextDirection() {
    switch (customTextDirection) {
      case CustomTextDirection.localeBased:
        final language = locale?.languageCode.toLowerCase();
        if (language == null) return null;
        return TextDirection.ltr;
      case CustomTextDirection.rtl:
        return TextDirection.rtl;
      default:
        return TextDirection.ltr;
    }
  }

  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness? brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance?.window.platformBrightness;
    }
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return overlayStyle;
  }

  ClientOptions copyWith(
          {ThemeMode? themeMode,
          double? textScaleFactor,
          CustomTextDirection? customTextDirection,
          Locale? locale,
          double? timeDilation,
          TargetPlatform? platform,
          bool? isTestMode}) =>
      ClientOptions(
          themeMode: themeMode ?? this.themeMode,
          textScaleFactor: textScaleFactor ?? _textScaleFactor,
          customTextDirection: customTextDirection ?? this.customTextDirection,
          locale: locale ?? this.locale,
          timeDilation: timeDilation ?? this.timeDilation,
          platform: platform ?? this.platform,
          isTestMode: isTestMode ?? this.isTestMode);

  @override
  bool operator ==(Object other) =>
      other is ClientOptions &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      customTextDirection == other.customTextDirection &&
      locale == other.locale &&
      timeDilation == other.timeDilation &&
      platform == other.platform &&
      isTestMode == other.isTestMode;

  @override
  int get hashCode => hashValues(themeMode, _textScaleFactor,
      customTextDirection, locale, timeDilation, platform, isTestMode);

  static ClientOptions? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>())
          ?.modelBindingState
          .currentModel;

  static void update(BuildContext context, ClientOptions newModel) =>
      (context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>())
          ?.modelBindingState
          .updateModel(newModel);
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = ClientOptions.of(context);
    final textDirection = options?.resolvedTextDirection();
    final textScaleFactor = options?.textScaleFactor(context);

    Widget widget = MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
        child: child);
    return textDirection == null
        ? widget
        : Directionality(textDirection: textDirection, child: widget);
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope(
      {Key? key, required this.modelBindingState, required Widget child})
      : super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding(
      {Key? key,
      this.initialModel = const ClientOptions(timeDilation: 0.0),
      required this.child})
      : assert(initialModel != null),
        super(key: key);

  final ClientOptions? initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  ClientOptions? currentModel;
  Timer? _timeDilationTimer;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }

  void handleTimeDilation(ClientOptions newModel) {
    if (currentModel?.timeDilation != newModel.timeDilation) {
      _timeDilationTimer?.cancel();
      _timeDilationTimer = null;
      if (newModel.timeDilation > 1) {
        _timeDilationTimer = Timer(const Duration(milliseconds: 150), () {
          timeDilation = newModel.timeDilation;
        });
      } else {
        timeDilation = newModel.timeDilation;
      }
    }
  }

  void updateModel(ClientOptions newModel) {
    if (newModel != currentModel) {
      handleTimeDilation(newModel);
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      _ModelBindingScope(modelBindingState: this, child: widget.child);
}
