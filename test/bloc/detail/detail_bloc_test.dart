import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';

import 'package:marvel/app/view_model/details/character_detail_bloc.dart';
import 'package:marvel/app/view_model/details/character_detail_event.dart';
import 'package:marvel/app/view_model/details/character_detail_state.dart';

import 'package:marvel/app/repositories/implementation/marvel_repository_impl.dart';

import '../../test_helpers/test_helper.mocks.dart';

void main() {
  group('CharacterBloc', () {
    late MarvelRepositoryImpl marvelRepositoryImpl;
    late CharDetailBloc charDetailBloc;

    setUp(() {
      marvelRepositoryImpl = MockMarvelRepositoryImpl();
      charDetailBloc = CharDetailBloc(marvelRepositoryImpl);
    });

    tearDown(() {
      charDetailBloc.close();
    });

    blocTest<CharDetailBloc, CharDetailState>(
      'emits CharDetailState with loadingComics set to true and then false when CharacterComicsDetailLoad event is added and successful response is received',
      build: () {
        const character = Character(
          id: 1,
          name: 'Character',
          description: 'Description',
          modified: 'Modified',
          resourceURI: 'Resource URI',
          thumbnail: Thumbnail.empty(),
          comic: Comic.empty(),
          storie: Storie.empty(),
          event: Event.empty(),
        );
        when(marvelRepositoryImpl.getComics(id: character.id)).thenAnswer(
          (_) async => const Right(DetailResponse(results: [
            ComicDetail(
              id: 1,
              title: '',
              description: '',
              thumbnail: Thumbnail.empty(),
            )
          ], code: 200)),
        );
        return charDetailBloc;
      },
      act: (bloc) => bloc.add(
        CharacterComicsDetailLoad(
          character: const Character(
            id: 1,
            name: 'Character',
            description: 'Description',
            modified: 'Modified',
            resourceURI: 'Resource URI',
            thumbnail: Thumbnail.empty(),
            comic: Comic.empty(),
            storie: Storie.empty(),
            event: Event.empty(),
          ),
        ),
      ),
      expect: () => [
        const CharDetailState(loadingComics: true, comics: []),
        const CharDetailState(loadingComics: false, comics: [
          ComicDetail(
            id: 1,
            title: '',
            description: '',
            thumbnail: Thumbnail.empty(),
          )
        ]),
      ],
    );

    blocTest<CharDetailBloc, CharDetailState>(
      'emits CharDetailState with loadingSeries set to true and then false when CharacterSeriesDetailLoad event is added and successful response is received',
      build: () {
        const character = Character(
          id: 1,
          name: 'Character',
          description: 'Description',
          modified: 'Modified',
          resourceURI: 'Resource URI',
          thumbnail: Thumbnail.empty(),
          comic: Comic.empty(),
          storie: Storie.empty(),
          event: Event.empty(),
        );
        when(marvelRepositoryImpl.getSeries(id: character.id)).thenAnswer(
          (_) async => const Right(DetailResponse(results: [
            SerieDetail(
              id: 1,
              title: '',
              description: '',
              thumbnail: Thumbnail.empty(),
            )
          ], code: 200)),
        );
        return charDetailBloc;
      },
      act: (bloc) => bloc.add(
        CharacterSeriesDetailLoad(
          character: const Character(
            id: 1,
            name: 'Character',
            description: 'Description',
            modified: 'Modified',
            resourceURI: 'Resource URI',
            thumbnail: Thumbnail.empty(),
            comic: Comic.empty(),
            storie: Storie.empty(),
            event: Event.empty(),
          ),
        ),
      ),
      expect: () => [
        const CharDetailState(loadingSeries: true, series: []),
        const CharDetailState(loadingSeries: false, series: [
          SerieDetail(
            id: 1,
            title: '',
            description: '',
            thumbnail: Thumbnail.empty(),
          )
        ]),
      ],
    );

    blocTest<CharDetailBloc, CharDetailState>(
      'emits CharDetailState with loadingEvent set to true and then false when CharacterEventDetailLoad event is added and successful response is received',
      build: () {
        const character = Character(
          id: 1,
          name: 'Character',
          description: 'Description',
          modified: 'Modified',
          resourceURI: 'Resource URI',
          thumbnail: Thumbnail.empty(),
          comic: Comic.empty(),
          storie: Storie.empty(),
          event: Event.empty(),
        );
        when(marvelRepositoryImpl.getEvents(id: character.id)).thenAnswer(
          (_) async => const Right(DetailResponse(results: [
            EventDetail(
              id: 1,
              title: '',
              description: '',
              thumbnail: Thumbnail.empty(),
            )
          ], code: 200)),
        );
        return charDetailBloc;
      },
      act: (bloc) => bloc.add(
        CharacterEventsDetailLoad(
          character: const Character(
            id: 1,
            name: 'Character',
            description: 'Description',
            modified: 'Modified',
            resourceURI: 'Resource URI',
            thumbnail: Thumbnail.empty(),
            comic: Comic.empty(),
            storie: Storie.empty(),
            event: Event.empty(),
          ),
        ),
      ),
      expect: () => [
        const CharDetailState(loadingEvents: true, events: []),
        const CharDetailState(loadingEvents: false, events: [
          EventDetail(
            id: 1,
            title: '',
            description: '',
            thumbnail: Thumbnail.empty(),
          )
        ]),
      ],
    );
  });
}
