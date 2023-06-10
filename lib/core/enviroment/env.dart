import 'package:marvel/core/enum/enviroments.enum.dart';

abstract class Environments {
  String get apiURL => '';
  EnviromentEnum get env => EnviromentEnum.none;
}
