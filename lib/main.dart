import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task/app/app.dart';
import 'app/shared/signals/theme.dart' as theme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dispatcher = SchedulerBinding.instance.platformDispatcher;
  dispatcher.onPlatformBrightnessChanged = () {
    theme.setThemeFromBrightness(dispatcher.platformBrightness);
  };
  runApp(const MyApp());
}
