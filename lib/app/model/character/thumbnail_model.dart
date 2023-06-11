import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';

class Thumbnail extends Equatable {
  final String path;
  final String exten;

  const Thumbnail({
    required this.path,
    required this.exten,
  });

  const Thumbnail.empty()
      : path = '',
        exten = '';

  factory Thumbnail.fromJson(Map<String, dynamic>? json) {
    return Thumbnail(
      path: ValidatorUtils.containsKey(json, 'path', ''),
      exten: ValidatorUtils.containsKey(json, 'extension', ''),
    );
  }

  String toValidImg() => exten.isNotEmpty ? '$path.$exten' : '';

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': exten,
    };
  }

  @override
  List<Object?> get props => [path, exten];
}
