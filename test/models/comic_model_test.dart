import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/item_model.dart';

void main() {
  group('Comic', () {
    test('two instances with the same properties should be equal', () {
      const comic1 = Comic(
        available: 10,
        collectionURI: 'collection1',
        items: [Item.empty(), Item.empty()],
        returned: 5,
      );
      const comic2 = Comic(
        available: 10,
        collectionURI: 'collection1',
        items: [Item.empty(), Item.empty()],
        returned: 5,
      );

      expect(comic1, equals(comic2));
    });

    test('toJson() should return a valid map', () {
      const comic = Comic(
        available: 10,
        collectionURI: 'collection1',
        items: [Item.empty(), Item.empty()],
        returned: 5,
      );

      final json = comic.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['available'], equals(10));
      expect(json['collectionURI'], equals('collection1'));
      expect(json['items'], isA<List<dynamic>>());
      expect(json['items'].length, equals(2));
      expect(json['returned'], equals(5));
    });

    test('fromJson() should create a valid instance', () {
      final json = {
        'available': 10,
        'collectionURI': 'collection1',
        'items': [
          const Item.empty().toJson(), // Item JSON representation
          const Item.empty().toJson(), // Item JSON representation
        ],
        'returned': 5,
      };

      final comic = Comic.fromJson(json);

      expect(comic, isA<Comic>());
      expect(comic.available, equals(10));
      expect(comic.collectionURI, equals('collection1'));
      expect(comic.items, isA<List<Item>>());
      expect(comic.items.length, equals(2));
      expect(comic.returned, equals(5));
    });

    test('empty() constructor should create an empty instance', () {
      const comic = Comic.empty();

      expect(comic, isA<Comic>());
      expect(comic.available, equals(0));
      expect(comic.collectionURI, equals(''));
      expect(comic.items, isEmpty);
      expect(comic.returned, equals(0));
    });

    test('props should return the correct list of properties', () {
      const comic = Comic(
        available: 10,
        collectionURI: 'collection1',
        items: [Item.empty(), Item.empty()],
        returned: 5,
      );

      final props = comic.props;

      expect(props, isA<List<Object?>>());
      expect(props.length, equals(4));
      expect(props[0], equals(10));
      expect(props[1], equals('collection1'));
      expect(props[2], equals(comic.items));
      expect(props[3], equals(5));
    });
  });
}
