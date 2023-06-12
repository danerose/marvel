import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marvel/core/enviroment/env.dev.dart';
import 'package:marvel/core/enum/exceptions.enum.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';
import 'package:marvel/app/model/response/character_response_model.dart';

import 'package:marvel/app/repositories/implementation/marvel_repository_impl.dart';

import '../test_helpers/dummy/json_reader_helper.dart';
import '../test_helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpService;
  late MarvelRepositoryImpl marvelRepositoryImpl;

  setUp(() {
    mockHttpService = MockHttpClient();
    marvelRepositoryImpl = MarvelRepositoryImpl(
      env: DevelopmentEnv(),
      httpService: mockHttpService,
    );
  });

  group('Get Character', () {
    test('Should Retun a CharacterResponse Model on code 200', () async {
      final response = json.decode(readCharacterListJson());
      final expectedModel = CharacterResponse.fromJson(response);

      when(
        mockHttpService.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options')),
      ).thenAnswer((_) async => Response(
            data: response,
            requestOptions: RequestOptions(),
          ));
      final result = await marvelRepositoryImpl.getCharacters();

      expect(result, isA<Right<CustomException, CharacterResponse>>());
      expect(
        result.getOrElse(() => throw Exception()),
        isA<CharacterResponse>(),
      );
      expect(result, equals(Right(expectedModel)));
      verify(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options')))
          .called(1);
    });

    test('should throw an exception when an error occurs', () async {
      const exception = CustomException(
          status: 500,
          error: ExceptionEnum.internal,
          data: null,
          message: 'Internal Server Error');
      when(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(exception);

      // Act
      final result = await marvelRepositoryImpl.getCharacters();

      // Assert
      expect(result, isA<Left<CustomException, CharacterResponse>>());
      expect(result.fold((l) => l, (r) => throw Exception()), exception);
    });
  });

  group('Get Comic Detail', () {
    test('Should Retun a DetailResponseResponse Model on code 200', () async {
      final response = json.decode(readComicDetailJson());
      final expectedModel = DetailResponse.fromJson(
        response,
        ComicDetail.fromJson,
      );

      when(
        mockHttpService.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options')),
      ).thenAnswer((_) async => Response(
            data: response,
            requestOptions: RequestOptions(),
          ));
      final result = await marvelRepositoryImpl.getComics(id: 0);

      expect(result, isA<Right<CustomException, DetailResponse>>());
      expect(
        result.getOrElse(() => throw Exception()),
        isA<DetailResponse>(),
      );
      expect(result, equals(Right(expectedModel)));
      verify(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options')))
          .called(1);
    });

    test('should throw an exception when an error occurs', () async {
      const exception = CustomException(
          status: 500,
          error: ExceptionEnum.internal,
          data: null,
          message: 'Internal Server Error');
      when(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(exception);

      // Act
      final result = await marvelRepositoryImpl.getComics(id: 0);

      // Assert
      expect(result, isA<Left<CustomException, DetailResponse>>());
      expect(result.fold((l) => l, (r) => throw Exception()), exception);
    });
  });

  group('Get Serie Detail', () {
    test('Should Retun a DetailResponseResponse Model on code 200', () async {
      final response = json.decode(readSerieDetailJson());
      final expectedModel = DetailResponse.fromJson(
        response,
        SerieDetail.fromJson,
      );

      when(
        mockHttpService.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options')),
      ).thenAnswer((_) async => Response(
            data: response,
            requestOptions: RequestOptions(),
          ));
      final result = await marvelRepositoryImpl.getSeries(id: 0);

      expect(result, isA<Right<CustomException, DetailResponse>>());
      expect(
        result.getOrElse(() => throw Exception()),
        isA<DetailResponse>(),
      );
      expect(result, equals(Right(expectedModel)));
      verify(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options')))
          .called(1);
    });

    test('should throw an exception when an error occurs', () async {
      const exception = CustomException(
          status: 500,
          error: ExceptionEnum.internal,
          data: null,
          message: 'Internal Server Error');
      when(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(exception);

      // Act
      final result = await marvelRepositoryImpl.getComics(id: 0);

      // Assert
      expect(result, isA<Left<CustomException, DetailResponse>>());
      expect(result.fold((l) => l, (r) => throw Exception()), exception);
    });
  });

  group('Get Events Detail', () {
    test('Should Retun a DetailResponseResponse Model on code 200', () async {
      final response = json.decode(readSerieDetailJson());
      final expectedModel = DetailResponse.fromJson(
        response,
        EventDetail.fromJson,
      );

      when(
        mockHttpService.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options')),
      ).thenAnswer((_) async => Response(
            data: response,
            requestOptions: RequestOptions(),
          ));
      final result = await marvelRepositoryImpl.getEvents(id: 0);

      expect(result, isA<Right<CustomException, DetailResponse>>());
      expect(
        result.getOrElse(() => throw Exception()),
        isA<DetailResponse>(),
      );
      expect(result, equals(Right(expectedModel)));
      verify(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options')))
          .called(1);
    });

    test('should throw an exception when an error occurs', () async {
      const exception = CustomException(
          status: 500,
          error: ExceptionEnum.internal,
          data: null,
          message: 'Internal Server Error');
      when(mockHttpService.get(any,
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(exception);

      // Act
      final result = await marvelRepositoryImpl.getComics(id: 0);

      // Assert
      expect(result, isA<Left<CustomException, DetailResponse>>());
      expect(result.fold((l) => l, (r) => throw Exception()), exception);
    });
  });
}
