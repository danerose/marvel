import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';

void main() {
  group('Thumbnail', () {
    test('two instances with the same properties should be equal', () {
      const thumbnail1 = Thumbnail(
        path: 'path1',
        exten: 'ext1',
      );

      const thumbnail2 = Thumbnail(
        path: 'path1',
        exten: 'ext1',
      );

      expect(thumbnail1, equals(thumbnail2));
    });

    test('toJson() should return a valid map', () {
      const thumbnail = Thumbnail(
        path: 'path1',
        exten: 'ext1',
      );

      final json = thumbnail.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['path'], equals('path1'));
      expect(json['extension'], equals('ext1'));
    });

    test('fromJson() should create a valid instance', () {
      const json = {
        'path': 'path1',
        'extension': 'ext1',
      };

      final thumbnail = Thumbnail.fromJson(json);

      expect(thumbnail, isA<Thumbnail>());
      expect(thumbnail.path, equals('path1'));
      expect(thumbnail.exten, equals('ext1'));
    });

    test('toValidImg() should return a valid image URL', () {
      const thumbnail = Thumbnail(
        path: 'path1',
        exten: 'ext1',
      );

      final imageUrl = thumbnail.toValidImg();

      expect(imageUrl, equals('path1.ext1'));
    });

    test('empty() constructor should create an empty instance', () {
      const thumbnail = Thumbnail.empty();

      expect(thumbnail, isA<Thumbnail>());
      expect(thumbnail.path, equals(''));
      expect(thumbnail.exten, equals(''));
    });

    test('props should return the correct list of properties', () {
      const thumbnail = Thumbnail(
        path: 'path1',
        exten: 'ext1',
      );

      final props = thumbnail.props;

      expect(props, isA<List<Object?>>());
      expect(props.length, equals(2));
      expect(props[0], equals('path1'));
      expect(props[1], equals('ext1'));
    });
  });
}
