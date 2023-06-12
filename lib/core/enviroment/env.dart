import 'package:marvel/core/enum/enviroments.enum.dart';

abstract class Environment {
  String get apiURL => '';
  String get apiPubKey => '';
  String get apiPrivKey => '';
  String get timeStamp => '';
  String get hash => '';
  EnviromentEnum get env => EnviromentEnum.none;
}
