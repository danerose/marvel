import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/item_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';

void main() {
  group('Storie', () {
    test('two instances with the same properties should be equal', () {
      const storie1 = Storie(
        available: 10,
        collectionURI: 'collectionURI1',
        items: [
          Item(
            resourceURI: 'resourceURI1',
            name: 'item1',
            type: 'type1',
          ),
        ],
        returned: 5,
      );

      const storie2 = Storie(
        available: 10,
        collectionURI: 'collectionURI1',
        items: [
          Item(
            resourceURI: 'resourceURI1',
            name: 'item1',
            type: 'type1',
          ),
        ],
        returned: 5,
      );

      expect(storie1, equals(storie2));
    });

    test('toJson() should return a valid map', () {
      const storie = Storie(
        available: 10,
        collectionURI: 'collectionURI1',
        items: [
          Item(
            resourceURI: 'resourceURI1',
            name: 'item1',
            type: 'type1',
          ),
        ],
        returned: 5,
      );

      final json = storie.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['available'], equals(10));
      expect(json['collectionURI'], equals('collectionURI1'));
      expect(json['items'], isA<List<dynamic>>());
      expect(json['items'][0], isA<Map<String, dynamic>>());
      expect(json['items'][0]['resourceURI'], equals('resourceURI1'));
      expect(json['items'][0]['name'], equals('item1'));
      expect(json['items'][0]['type'], equals('type1'));
      expect(json['returned'], equals(5));
    });

    test('fromJson() should return a valid Storie instance', () {
      final json = {
        'available': 10,
        'collectionURI': 'collectionURI1',
        'items': [
          {
            'resourceURI': 'resourceURI1',
            'name': 'item1',
            'type': 'type1',
          },
        ],
        'returned': 5,
      };

      final storie = Storie.fromJson(json);

      expect(storie, isA<Storie>());
      expect(storie.available, equals(10));
      expect(storie.collectionURI, equals('collectionURI1'));
      expect(storie.items, isA<List<Item>>());
      expect(storie.items.length, equals(1));
      expect(storie.items[0].resourceURI, equals('resourceURI1'));
      expect(storie.items[0].name, equals('item1'));
      expect(storie.items[0].type, equals('type1'));
      expect(storie.returned, equals(5));
    });

    test('fromJson() should return an empty Storie instance if json is null',
        () {
      final storie = Storie.fromJson(null);

      expect(storie, isA<Storie>());
      expect(storie.available, equals(0));
      expect(storie.collectionURI, equals(''));
      expect(storie.items, isA<List<Item>>());
      expect(storie.items.length, equals(0));
      expect(storie.returned, equals(0));
    });
  });
}
