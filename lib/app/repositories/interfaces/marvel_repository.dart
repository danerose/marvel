import 'package:dartz/dartz.dart';
import 'package:marvel/app/model/response/character_response_model.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

abstract class MarvelRepository {
  Future<Either<CustomException, CharacterResponse>> getCharacters();
}
