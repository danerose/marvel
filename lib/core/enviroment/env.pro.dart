import 'package:marvel/core/enviroment/env.dart';
import 'package:marvel/core/enum/enviroments.enum.dart';

class ProductionEnv implements Environment {
  @override
  String get apiURL => 'https://gateway.marvel.com/v1/public';

  @override
  String get apiPubKey => 'fea4ddbf370376865724c2b03db5ffef';

  @override
  String get apiPrivKey => 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';

  @override
  EnviromentEnum get env => EnviromentEnum.production;
}
