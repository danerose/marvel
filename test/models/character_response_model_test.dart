import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/model/response/character_response_model.dart';

void main() {
  group('CharacterResponse', () {
    test('two instances with the same properties should be equal', () {
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

      const response1 = CharacterResponse(
        code: 200,
        characters: [character1, character2],
      );

      const response2 = CharacterResponse(
        code: 200,
        characters: [character1, character2],
      );

      expect(response1, equals(response2));
    });

    test('fromJson() should return a valid CharacterResponse instance', () {
      final json = {
        'code': 200,
        'data': {
          'results': [
            {
              'id': 1,
              'name': 'Character 1',
              'description': 'Description 1',
              'modified': 'Modified 1',
              'resourceURI': 'Resource URI 1',
              'thumbnail': null,
              'comics': null,
              'stories': null,
              'events': null,
            },
            {
              'id': 2,
              'name': 'Character 2',
              'description': 'Description 2',
              'modified': 'Modified 2',
              'resourceURI': 'Resource URI 2',
              'thumbnail': null,
              'comics': null,
              'stories': null,
              'events': null,
            }
          ]
        }
      };

      final response = CharacterResponse.fromJson(json);

      expect(response, isA<CharacterResponse>());
      expect(response.code, equals(200));
      expect(response.characters, isA<List<Character>>());
      expect(response.characters.length, equals(2));

      final character1 = response.characters[0];
      expect(character1, isA<Character>());
      expect(character1.id, equals(1));
      expect(character1.name, equals('Character 1'));
      expect(character1.description, equals('Description 1'));
      expect(character1.modified, equals('Modified 1'));
      expect(character1.resourceURI, equals('Resource URI 1'));
      expect(character1.thumbnail, equals(const Thumbnail.empty()));
      expect(character1.comic, equals(const Comic.empty()));
      expect(character1.storie, equals(const Storie.empty()));
      expect(character1.event, equals(const Event.empty()));

      final character2 = response.characters[1];
      expect(character2, isA<Character>());
      expect(character2.id, equals(2));
      expect(character2.name, equals('Character 2'));
      expect(character2.description, equals('Description 2'));
      expect(character2.modified, equals('Modified 2'));
      expect(character2.resourceURI, equals('Resource URI 2'));
      expect(character2.thumbnail, equals(const Thumbnail.empty()));
      expect(character2.comic, equals(const Comic.empty()));
      expect(character2.storie, equals(const Storie.empty()));
      expect(character2.event, equals(const Event.empty()));
    });
  });
}
