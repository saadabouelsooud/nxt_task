import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:task/app/shared/extensions/context.dart';
import 'package:task/app/shared/signals/theme.dart';

class MainTheme {
  const MainTheme();

  final _textTheme = const TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 2),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

    labelSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),

    // for buttons
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  Signal<ThemeMode> get signal => themeSignal;

  ThemeData lightThemeData(BuildContext context) => ThemeData(
        useMaterial3: true,
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        bottomSheetTheme: BottomSheetThemeData(
          dragHandleColor: context.colorScheme.outlineVariant,
          backgroundColor: context.colorScheme.outline,
          dragHandleSize: const Size(53, 6),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const BeveledRectangleBorder(),
            side: BorderSide(
              color: context.colorScheme.secondary,
              width: .5,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const BeveledRectangleBorder(),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: const BeveledRectangleBorder(),
          ),
        ),
        textTheme: _textTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      );

  ThemeData darkThemeData(BuildContext context) => ThemeData(
        useMaterial3: true,
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        bottomSheetTheme: BottomSheetThemeData(
          dragHandleColor: context.colorScheme.outlineVariant,
          backgroundColor: context.colorScheme.outline,
          dragHandleSize: const Size(53, 6),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const BeveledRectangleBorder(),
            side: BorderSide(
              color: context.colorScheme.secondary,
              width: .5,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const BeveledRectangleBorder(),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: const BeveledRectangleBorder(),
          ),
        ),
        textTheme: _textTheme,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
      );
}
