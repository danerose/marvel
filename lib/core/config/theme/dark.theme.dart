import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:marvel/core/constant/colors.constants.dart';

final ThemeData marvelDark = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    seedColor: injector.get<ColorsConstants>().primary,
    brightness: Brightness.dark,
  ),
);
