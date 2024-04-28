import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double ratioHeight(double value) => (height * value) / 812;
  double ratioWidth(double value) => (width * value) / 375;
}
