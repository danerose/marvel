import 'package:flutter/material.dart';
import 'package:marvel/core/enum/enviroments.enum.dart';

class ColorsConstants {
  final EnviromentEnum env;
  const ColorsConstants({required this.env});

  Color get primary {
    switch (env) {
      case EnviromentEnum.development:
        return Colors.deepPurple;
      case EnviromentEnum.staging:
        return const Color.fromARGB(255, 255, 159, 247);
      default:
        return const Color.fromARGB(255, 127, 74, 138);
    }
  }

  static const Color background = Color.fromARGB(255, 31, 24, 31);
  static const Color alt = Color.fromARGB(255, 108, 19, 143);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color disabled = Color.fromARGB(255, 212, 205, 205);
  static const Color grey = Color.fromARGB(255, 100, 100, 100);
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color success = Color.fromRGBO(102, 206, 106, 1);
  static const Color error = Color.fromRGBO(244, 62, 80, 1);
  static const Color warning = Color.fromRGBO(196, 160, 3, 1);
}
