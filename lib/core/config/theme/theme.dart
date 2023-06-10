import 'package:flutter/material.dart';
import 'package:marvel/core/config/theme/dark.theme.dart';
import 'package:marvel/core/config/theme/light.theme.dart';

class CustomTheme {
  static ThemeData light() {
    return marvelLight;
  }

  static ThemeData dark() {
    return marvelDark;
  }
}
