import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';

void main() {
  group('DetailResponse ComicDetail', () {
    test('two instances with the same properties should be equal', () {
      const response1 = DetailResponse<ComicDetail>(
        code: 200,
        results: [
          ComicDetail.empty(),
          ComicDetail.empty(),
        ],
      );

      const response2 = DetailResponse<ComicDetail>(
        code: 200,
        results: [
          ComicDetail.empty(),
          ComicDetail.empty(),
        ],
      );

      expect(response1, equals(response2));
    });

    test('fromJson() should return a valid DetailResponse instance', () {
      final json = {
        'code': 200,
        'data': {
          'results': [
            {'id': 1, 'title': 'Comic 1', 'description': 'Description 1'},
            {'id': 2, 'title': 'Comic 2', 'description': 'Description 2'},
          ],
        },
      };

      final response = DetailResponse.fromJson(json, (json) {
        return ComicDetail.fromJson(json);
      });

      expect(response, isA<DetailResponse<ComicDetail>>());
      expect(response.code, equals(200));
      expect(response.results.length, equals(2));
      expect(response.results[0], isA<ComicDetail>());
      expect(response.results[0].id, equals(1));
      expect(response.results[0].title, equals('Comic 1'));
      expect(response.results[0].description, equals('Description 1'));
      expect(response.results[1], isA<ComicDetail>());
      expect(response.results[1].id, equals(2));
      expect(response.results[1].title, equals('Comic 2'));
      expect(response.results[1].description, equals('Description 2'));
    });
  });

  group('DetailResponse EventDetail', () {
    test('two instances with the same properties should be equal', () {
      const response1 = DetailResponse<EventDetail>(
        code: 200,
        results: [
          EventDetail.empty(),
          EventDetail.empty(),
        ],
      );

      const response2 = DetailResponse<EventDetail>(
        code: 200,
        results: [
          EventDetail.empty(),
          EventDetail.empty(),
        ],
      );

      expect(response1, equals(response2));
    });

    test('fromJson() should return a valid DetailResponse instance', () {
      final json = {
        'code': 200,
        'data': {
          'results': [
            {'id': 1, 'title': 'Event 1', 'description': 'Description 1'},
            {'id': 2, 'title': 'Event 2', 'description': 'Description 2'},
          ],
        },
      };

      final response = DetailResponse.fromJson(json, (json) {
        return EventDetail.fromJson(json);
      });

      expect(response, isA<DetailResponse<EventDetail>>());
      expect(response.code, equals(200));
      expect(response.results.length, equals(2));
      expect(response.results[0], isA<EventDetail>());
      expect(response.results[0].id, equals(1));
      expect(response.results[0].title, equals('Event 1'));
      expect(response.results[0].description, equals('Description 1'));
      expect(response.results[1], isA<EventDetail>());
      expect(response.results[1].id, equals(2));
      expect(response.results[1].title, equals('Event 2'));
      expect(response.results[1].description, equals('Description 2'));
    });
  });

  group('DetailResponse SerieDetail', () {
    test('two instances with the same properties should be equal', () {
      const response1 = DetailResponse<SerieDetail>(
        code: 200,
        results: [
          SerieDetail.empty(),
          SerieDetail.empty(),
        ],
      );

      const response2 = DetailResponse<SerieDetail>(
        code: 200,
        results: [
          SerieDetail.empty(),
          SerieDetail.empty(),
        ],
      );

      expect(response1, equals(response2));
    });

    test('fromJson() should return a valid DetailResponse instance', () {
      final json = {
        'code': 200,
        'data': {
          'results': [
            {'id': 1, 'title': 'Serie 1', 'description': 'Description 1'},
            {'id': 2, 'title': 'Serie 2', 'description': 'Description 2'},
          ],
        },
      };

      final response = DetailResponse.fromJson(json, (json) {
        return SerieDetail.fromJson(json);
      });

      expect(response, isA<DetailResponse<SerieDetail>>());
      expect(response.code, equals(200));
      expect(response.results.length, equals(2));
      expect(response.results[0], isA<SerieDetail>());
      expect(response.results[0].id, equals(1));
      expect(response.results[0].title, equals('Serie 1'));
      expect(response.results[0].description, equals('Description 1'));
      expect(response.results[1], isA<SerieDetail>());
      expect(response.results[1].id, equals(2));
      expect(response.results[1].title, equals('Serie 2'));
      expect(response.results[1].description, equals('Description 2'));
    });
  });
}
