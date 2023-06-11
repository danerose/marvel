import 'package:dartz/dartz.dart';
import 'package:marvel/core/utils/generate.util.dart';

import 'package:marvel/core/enviroment/env.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';
import 'package:marvel/core/constant/marvel_api.constants.dart';
import 'package:marvel/core/services/network/http.service.dart';

import 'package:marvel/app/model/response/character_response_model.dart';
import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  final Environment env;
  final HttpService httpService;
  const MarvelRepositoryImpl({
    required this.env,
    required this.httpService,
  });

  @override
  Future<Either<CustomException, CharacterResponse>> getCharacters() async {
    try {
      final timeStamp = GenerateUtil.genTimeStamp();
      final res = await httpService.get(
        MarvelApiConstants.characters,
        queryParameters: {
          'apikey': env.apiPubKey,
          'hash': GenerateUtil.genMarvelHash(env, timeStamp),
          'ts': timeStamp,
        },
      );
      return Right(CharacterResponse.fromJson(res.data));
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
