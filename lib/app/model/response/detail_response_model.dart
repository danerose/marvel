import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';

class DetailResponse<T> extends Equatable {
  final int code;
  final List<T> results;

  const DetailResponse({
    required this.code,
    required this.results,
  });

  factory DetailResponse.fromJson(
    Map<String, dynamic>? json,
    T Function(
      Map<String, dynamic>? json,
    ) fromJson,
  ) {
    return DetailResponse(
      code: ValidatorUtils.containsKey<int>(json, 'code', 0),
      results: List<T>.from(
        ValidatorUtils.containsKey(json?['data'], 'results', []).map(
          (e) => fromJson(e),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [code, results];
}
