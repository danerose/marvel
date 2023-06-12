import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/item_model.dart';

void main() {
  group('Item', () {
    test('two instances with the same properties should be equal', () {
      const item1 = Item(
        resourceURI: 'resource1',
        name: 'item1',
        type: 'type1',
      );

      const item2 = Item(
        resourceURI: 'resource1',
        name: 'item1',
        type: 'type1',
      );

      expect(item1, equals(item2));
    });

    test('toJson() should return a valid map', () {
      const item = Item(
        resourceURI: 'resource1',
        name: 'item1',
        type: 'type1',
      );

      final json = item.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['resourceURI'], equals('resource1'));
      expect(json['name'], equals('item1'));
      expect(json['type'], equals('type1'));
    });

    test('fromJson() should create a valid instance', () {
      final json = {
        'resourceURI': 'resource1',
        'name': 'item1',
        'type': 'type1',
      };

      final item = Item.fromJson(json);

      expect(item, isA<Item>());
      expect(item.resourceURI, equals('resource1'));
      expect(item.name, equals('item1'));
      expect(item.type, equals('type1'));
    });

    test('empty() constructor should create an empty instance', () {
      const item = Item.empty();

      expect(item, isA<Item>());
      expect(item.resourceURI, equals(''));
      expect(item.name, equals(''));
      expect(item.type, equals(''));
    });

    test('props should return the correct list of properties', () {
      const item = Item(
        resourceURI: 'resource1',
        name: 'item1',
        type: 'type1',
      );

      final props = item.props;

      expect(props, isA<List<Object?>>());
      expect(props.length, equals(3));
      expect(props[0], equals('resource1'));
      expect(props[1], equals('item1'));
      expect(props[2], equals('type1'));
    });
  });
}
