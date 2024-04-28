import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signals/signals_flutter.dart';
import 'package:task/app/shared/signals/theme.dart' as theme;

Future<void> main() async {
  tearDown(() => theme.themeSignal.value = ThemeMode.system);

  test('Changes the current theme mode on click', () {
    expect(theme.themeSignal.value, ThemeMode.system);
    theme.toggleTheme();
    expect(theme.themeSignal.value, ThemeMode.dark);
    theme.toggleTheme();
    expect(theme.themeSignal.value, ThemeMode.light);
  });
  test('Sets the theme mode based on brightness', () {
    expect(theme.themeSignal.value, ThemeMode.system);
    theme.setThemeFromBrightness(Brightness.dark);
    expect(theme.themeSignal.value, ThemeMode.dark);
    theme.setThemeFromBrightness(Brightness.light);
    expect(theme.themeSignal.value, ThemeMode.light);
  });

  testWidgets('Checks if material app is watching the theme ', (tester) async {
    await tester.pumpWidget(Watch.builder(
      builder: (context) {
        return MaterialApp(
          themeMode: theme.themeSignal.value,
          // a button to toggle the theme
          home: const Material(
            child: ElevatedButton(
              key: Key('button'),
              onPressed: theme.toggleTheme,
              child: Text('Toggle Theme'),
            ),
          ),
        );
      },
    ));
    expect(theme.themeSignal.value, ThemeMode.system);
    await tester.tap(find.byKey(const Key('button')));
    await tester.pump();
    expect(theme.themeSignal.value, ThemeMode.dark);
  });

  testWidgets('Checks if platform dispacher listens and changes theme',
      (tester) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.onPlatformBrightnessChanged = () {
      theme.setThemeFromBrightness(dispatcher.platformBrightness);
    };
    dispatcher.platformBrightnessTestValue = Brightness.dark;

    expect(theme.themeSignal.value, ThemeMode.dark);
    dispatcher.platformBrightnessTestValue = Brightness.light;
    expect(theme.themeSignal.value, ThemeMode.light);
  });
}
