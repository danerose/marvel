import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/core/services/network/http.service.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  final HttpService httpService;
  const MarvelRepositoryImpl({required this.httpService});
}
