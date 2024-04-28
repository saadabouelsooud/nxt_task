import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:task/app/shared/router/router.dart';
import 'package:task/app/shared/theme/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final theme = const MainTheme();
  @override
  Widget build(BuildContext context) {
    return Watch.builder(
      builder: (context) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: theme.lightThemeData(context),
          darkTheme: theme.darkThemeData(context),
          themeMode: theme.signal.value,
        );
      },
    );
  }
}
