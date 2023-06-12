import 'package:dartz/dartz.dart';

import 'package:marvel/core/enviroment/env.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';
import 'package:marvel/core/constant/marvel_api.constants.dart';
import 'package:marvel/core/services/network/http.service.dart';

import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';

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
      final res = await httpService.get(
        MarvelApiConstants.characters,
        queryParameters: {
          'apikey': env.apiPubKey,
          'hash': env.hash,
          'ts': env.timeStamp,
        },
      );
      return Right(CharacterResponse.fromJson(res.data));
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, DetailResponse<ComicDetail>>> getComics({
    required int id,
  }) async {
    try {
      final res = await httpService.get(
        MarvelApiConstants.characterComicsById(id.toString()),
        queryParameters: {
          'apikey': env.apiPubKey,
          'hash': env.hash,
          'ts': env.timeStamp,
        },
      );
      return Right(DetailResponse.fromJson(res.data, ComicDetail.fromJson));
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, DetailResponse<EventDetail>>> getEvents({
    required int id,
  }) async {
    try {
      final res = await httpService.get(
        MarvelApiConstants.characterEventsById(id.toString()),
        queryParameters: {
          'apikey': env.apiPubKey,
          'hash': env.hash,
          'ts': env.timeStamp,
        },
      );
      return Right(DetailResponse.fromJson(res.data, EventDetail.fromJson));
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, DetailResponse<SerieDetail>>> getSeries({
    required int id,
  }) async {
    try {
      final res = await httpService.get(
        MarvelApiConstants.characterSeriesById(id.toString()),
        queryParameters: {
          'apikey': env.apiPubKey,
          'hash': env.hash,
          'ts': env.timeStamp,
        },
      );
      return Right(DetailResponse.fromJson(res.data, SerieDetail.fromJson));
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
