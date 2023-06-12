import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/app/model/character/character_model.dart';

void main() {
  group('Character', () {
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

      expect(character1, equals(character2));
    });

    test('fromJson() should return a valid Character instance', () {
      final json = {
        'id': 1,
        'name': 'Character 1',
        'description': 'Description 1',
        'modified': 'Modified 1',
        'resourceURI': 'Resource URI 1',
        'thumbnail': null,
        'comics': null,
        'stories': null,
        'events': null,
      };

      final character = Character.fromJson(json);

      expect(character, isA<Character>());
      expect(character.id, equals(1));
      expect(character.name, equals('Character 1'));
      expect(character.description, equals('Description 1'));
      expect(character.modified, equals('Modified 1'));
      expect(character.resourceURI, equals('Resource URI 1'));
      expect(character.thumbnail, isA<Thumbnail>());
      expect(character.comic, isA<Comic>());
      expect(character.storie, isA<Storie>());
      expect(character.event, isA<Event>());
    });

    test('toJson() should return a valid JSON map', () {
      const character = Character(
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

      final json = character.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals(1));
      expect(json['name'], equals('Character 1'));
      expect(json['description'], equals('Description 1'));
      expect(json['modified'], equals('Modified 1'));
      expect(json['resourceURI'], equals('Resource URI 1'));
      expect(json['thumbnail'], isA<Map<String, dynamic>>());
      expect(json['comics'], isA<Map<String, dynamic>>());
      expect(json['stories'], isA<Map<String, dynamic>>());
      expect(json['events'], isA<Map<String, dynamic>>());
    });
  });
}
