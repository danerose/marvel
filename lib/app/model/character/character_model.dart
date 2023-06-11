import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/character/thumbnail_model.dart';
import 'package:marvel/core/utils/validators.util.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String description;
  final String modified;
  final String resourceURI;
  final Thumbnail thumbnail;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.thumbnail,
  });

  factory Character.fromJson(Map<String, dynamic>? json) {
    return Character(
      id: ValidatorUtils.containsKey<int>(json, 'id', 0),
      name: ValidatorUtils.containsKey(json, 'name', ''),
      description: ValidatorUtils.containsKey(json, 'description', ''),
      modified: ValidatorUtils.containsKey(json, 'modified', ''),
      resourceURI: ValidatorUtils.containsKey(json, 'resourceURI', ''),
      thumbnail: Thumbnail.fromJson(
        ValidatorUtils.containsKey(json, 'thumbnail', null),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        resourceURI,
        thumbnail,
      ];
}
