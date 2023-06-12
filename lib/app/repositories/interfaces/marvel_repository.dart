import 'package:dartz/dartz.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/character_response_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

abstract class MarvelRepository {
  Future<Either<CustomException, CharacterResponse>> getCharacters();

  Future<Either<CustomException, DetailResponse<ComicDetail>>> getComics({
    required int id,
  });

  Future<Either<CustomException, DetailResponse<SerieDetail>>> getSeries({
    required int id,
  });

  Future<Either<CustomException, DetailResponse<EventDetail>>> getEvents({
    required int id,
  });
}
