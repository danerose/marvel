import 'package:marvel/core/enviroment/env.dart';
import 'package:marvel/core/enum/enviroments.enum.dart';

class StagingEnv implements Environments {
  @override
  String get apiURL => 'https://gateway.marvel.com/v1/public/characters';

  @override
  EnviromentEnum get env => EnviromentEnum.staging;
}
