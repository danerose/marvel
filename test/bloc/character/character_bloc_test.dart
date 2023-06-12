import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marvel/core/enum/exceptions.enum.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/model/response/character_response_model.dart';

import 'package:marvel/app/repositories/implementation/marvel_repository_impl.dart';

import 'package:marvel/app/view_model/characters/character_bloc.dart';
import 'package:marvel/app/view_model/characters/character_event.dart';
import 'package:marvel/app/view_model/characters/character_state.dart';

import '../../test_helpers/test_helper.mocks.dart';

void main() {
  group('CharacterBloc', () {
    late MarvelRepositoryImpl marvelRepositoryImpl;
    late CharacterBloc characterBloc;

    setUp(() {
      marvelRepositoryImpl = MockMarvelRepositoryImpl();
      characterBloc = CharacterBloc(marvelRepositoryImpl);
    });

    tearDown(() {
      characterBloc.close();
    });

    blocTest<CharacterBloc, CharacterState>(
      'emits [CharacterLoadingList, CharacterLoadedList] when CharacterLoadList event is added and successful response is received',
      build: () {
        const character1 = Character(
          id: 1,
          name: 'Character 1',
          description: 'Description 1',
          modified: 'Modified 1',
          resourceURI: 'Resource URI 1',
          thumbnail: Thumbnail.empty(),
          comic: Comic.empty(),
          storie: Storie.empty(),
          event: Event.empty(),
        );
        const character2 = Character(
          id: 2,
          name: 'Character 2',
          description: 'Description 2',
          modified: 'Modified 2',
          resourceURI: 'Resource URI 2',
          thumbnail: Thumbnail.empty(),
          comic: Comic.empty(),
          storie: Storie.empty(),
          event: Event.empty(),
        );
        final expectedCharacters = [character1, character2];
        when(marvelRepositoryImpl.getCharacters()).thenAnswer(
          (_) async => Right(CharacterResponse(
            code: 200,
            characters: expectedCharacters,
          )),
        );
        when(marvelRepositoryImpl.getCharacters()).thenAnswer(
          (_) async => Right(CharacterResponse(
            code: 200,
            characters: expectedCharacters,
          )),
        );
        return characterBloc;
      },
      act: (bloc) => bloc.add(CharacterLoadList()),
      wait: const Duration(milliseconds: 1000),
      expect: () => [
        CharacterLoadingList(),
        CharacterLoadedList(characters: const [
          Character(
            id: 1,
            name: 'Character 1',
            description: 'Description 1',
            modified: 'Modified 1',
            resourceURI: 'Resource URI 1',
            thumbnail: Thumbnail.empty(),
            comic: Comic.empty(),
            storie: Storie.empty(),
            event: Event.empty(),
          ),
          Character(
            id: 2,
            name: 'Character 2',
            description: 'Description 2',
            modified: 'Modified 2',
            resourceURI: 'Resource URI 2',
            thumbnail: Thumbnail.empty(),
            comic: Comic.empty(),
            storie: Storie.empty(),
            event: Event.empty(),
          ),
        ])
      ],
      verify: (bloc) {
        verify(marvelRepositoryImpl.getCharacters()).called(1);
      },
    );

    blocTest<CharacterBloc, CharacterState>(
      'emits [CharacterLoadingList, CharacterError] when CharacterLoadList event is added and error response is received',
      build: () {
        const exception = CustomException(
          status: 500,
          error: ExceptionEnum.internal,
          data: null,
          message: 'Internal Server Error',
        );
        when(marvelRepositoryImpl.getCharacters())
            .thenAnswer((_) async => const Left(exception));
        return characterBloc;
      },
      act: (bloc) => bloc.add(CharacterLoadList()),
      expect: () => [
        CharacterLoadingList(),
        CharacterError(),
      ],
      verify: (bloc) {
        verify(marvelRepositoryImpl.getCharacters()).called(1);
      },
    );
  });
}
