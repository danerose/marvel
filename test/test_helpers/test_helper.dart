import 'package:marvel/app/repositories/implementation/marvel_repository_impl.dart';
import 'package:marvel/core/services/network/http.service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [MarvelRepositoryImpl],
  customMocks: [MockSpec<HttpService>(as: #MockHttpClient)],
)
void main() {}
