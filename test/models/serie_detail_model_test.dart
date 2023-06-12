import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';

void main() {
  group('SerieDetail', () {
    test('two instances with the same properties should be equal', () {
      const thumbnail1 = Thumbnail(
        path: 'thumbnail1',
        exten: 'extension1',
      );

      const thumbnail2 = Thumbnail(
        path: 'thumbnail2',
        exten: 'extension2',
      );

      const comicDetail1 = SerieDetail(
        id: 1,
        title: 'Comic 1',
        description: 'Description 1',
        thumbnail: thumbnail1,
      );

      const comicDetail2 = SerieDetail(
        id: 2,
        title: 'Comic 2',
        description: 'Description 2',
        thumbnail: thumbnail2,
      );

      const comicDetail3 = SerieDetail(
        id: 1,
        title: 'Comic 1',
        description: 'Description 1',
        thumbnail: thumbnail1,
      );

      expect(comicDetail1, equals(comicDetail3));
      expect(comicDetail1 == comicDetail2, isFalse);
    });

    test('fromJson() should return a valid SerieDetail instance', () {
      final json = {
        'id': 1,
        'title': 'Comic 1',
        'description': 'Description 1',
        'thumbnail': {
          'path': 'thumbnail_path',
          'extension': 'thumbnail_extension',
        }
      };

      final comicDetail = SerieDetail.fromJson(json);

      expect(comicDetail, isA<SerieDetail>());
      expect(comicDetail.id, equals(1));
      expect(comicDetail.title, equals('Comic 1'));
      expect(comicDetail.description, equals('Description 1'));

      final thumbnail = comicDetail.thumbnail;
      expect(thumbnail, isA<Thumbnail>());
      expect(thumbnail.path, equals('thumbnail_path'));
      expect(thumbnail.exten, equals('thumbnail_extension'));
    });

    test('toJson() should return a valid JSON map', () {
      const thumbnail = Thumbnail(
        path: 'thumbnail_path',
        exten: 'thumbnail_extension',
      );

      const comicDetail = SerieDetail(
        id: 1,
        title: 'Comic 1',
        description: 'Description 1',
        thumbnail: thumbnail,
      );

      final json = comicDetail.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals(1));
      expect(json['title'], equals('Comic 1'));
      expect(json['description'], equals('Description 1'));

      final thumbnailJson = json['thumbnail'];
      expect(thumbnailJson, isA<Map<String, dynamic>>());
      expect(thumbnailJson['path'], equals('thumbnail_path'));
      expect(thumbnailJson['extension'], equals('thumbnail_extension'));
    });
  });
}
