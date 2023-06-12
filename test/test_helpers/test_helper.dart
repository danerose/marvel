import 'package:marvel/core/services/network/http.service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [],
  customMocks: [MockSpec<HttpService>(as: #MockHttpClient)],
)
void main() {}
