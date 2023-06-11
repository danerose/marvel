import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';

class Thumbnail extends Equatable {
  final String type;
  final String url;

  const Thumbnail({
    required this.type,
    required this.url,
  });

  factory Thumbnail.fromJson(Map<String, dynamic>? json) {
    return Thumbnail(
      type: ValidatorUtils.containsKey(json, 'type', ''),
      url: ValidatorUtils.containsKey(json, 'url', ''),
    );
  }

  String toValidImg() => type.isNotEmpty ? '$url.$type' : '';

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [type, url];
}
