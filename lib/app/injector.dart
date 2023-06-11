import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/core/enviroment/env.dart';
import 'package:marvel/core/config/size/size.config.dart';
import 'package:marvel/core/constant/colors.constants.dart';

import 'package:marvel/core/services/network/http.service.dart';
import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/app/repositories/implementation/marvel_repository_impl.dart';

final injector = GetIt.instance;

Future<void> init(Environment env) async {
  injector.registerSingleton<Environment>(env);
  injector.registerSingleton<SizeConfig>(SizeConfig());
  injector.registerSingleton<ColorsConstants>(ColorsConstants(env: env.env));
  injector.registerSingleton<HttpService>(
    HttpService(baseUrl: env.apiURL, dio: Dio()),
  );

  injector.registerLazySingleton<MarvelRepository>(
    () => MarvelRepositoryImpl(
      env: injector.get<Environment>(),
      httpService: injector.get<HttpService>(),
    ),
  );
}
