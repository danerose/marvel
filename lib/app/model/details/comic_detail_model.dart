import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/others/thumbnail_model.dart';
import 'package:marvel/core/utils/validators.util.dart';

class ComicDetail extends Equatable {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;

  const ComicDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  const ComicDetail.empty()
      : id = 0,
        name = '',
        description = '',
        thumbnail = const Thumbnail.empty();

  factory ComicDetail.fromJson(Map<String, dynamic>? json) {
    return ComicDetail(
      id: ValidatorUtils.containsKey<int>(json, 'id', 0),
      name: ValidatorUtils.containsKey(json, 'name', ''),
      description: ValidatorUtils.containsKey(json, 'description', ''),
      thumbnail: Thumbnail.fromJson(
        ValidatorUtils.containsKey(json, 'thumbnail', null),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail.toJson()
    };
  }

  @override
  List<Object?> get props => [id, name, description, thumbnail];
}
