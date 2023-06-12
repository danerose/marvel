import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/character/item_model.dart';

void main() {
  group('Event', () {
    test('two instances with the same properties should be equal', () {
      const event1 = Event(
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

      const event2 = Event(
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

      expect(event1, equals(event2));
    });

    test('toJson() should return a valid map', () {
      const event = Event(
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

      final json = event.toJson();

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

    test('fromJson() should return a valid Event instance', () {
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

      final event = Event.fromJson(json);

      expect(event, isA<Event>());
      expect(event.available, equals(10));
      expect(event.collectionURI, equals('collectionURI1'));
      expect(event.items, isA<List<Item>>());
      expect(event.items.length, equals(1));
      expect(event.items[0].resourceURI, equals('resourceURI1'));
      expect(event.items[0].name, equals('item1'));
      expect(event.items[0].type, equals('type1'));
      expect(event.returned, equals(5));
    });

    test('fromJson() should return an empty Event instance if json is null',
        () {
      final event = Event.fromJson(null);

      expect(event, isA<Event>());
      expect(event.available, equals(0));
      expect(event.collectionURI, equals(''));
      expect(event.items, isA<List<Item>>());
      expect(event.items.length, equals(0));
      expect(event.returned, equals(0));
    });
  });
}
