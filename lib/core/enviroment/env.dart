import 'package:marvel/core/enum/enviroments.enum.dart';

abstract class Environments {
  String get apiURL => '';
  String get apiPubKey => '';
  String get apiPrivKey => '';
  EnviromentEnum get env => EnviromentEnum.none;
}
