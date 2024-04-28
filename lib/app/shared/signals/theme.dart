import 'package:flutter/material.dart';
import 'package:signals/signals.dart';

final themeSignal = Signal<ThemeMode>(
  ThemeMode.system,
  debugLabel: 'themeSignal',
);

void toggleTheme() {
  themeSignal.value =
      themeSignal.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
}

void setThemeFromBrightness(Brightness brightness) {
  themeSignal.value =
      brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}
