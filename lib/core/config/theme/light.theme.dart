import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:marvel/core/constant/colors.constants.dart';

final ThemeData marvelLight = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    seedColor: injector.get<ColorsConstants>().primary,
    brightness: Brightness.light,
  ),
);
