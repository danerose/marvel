import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';

import 'package:marvel/app/model/character/comic_model.dart';
import 'package:marvel/app/model/character/event_model.dart';
import 'package:marvel/app/model/character/storie_model.dart';
import 'package:marvel/app/model/character/thumbnail_model.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String description;
  final String modified;
  final String resourceURI;
  final Thumbnail thumbnail;
  final Comic comic;
  final Storie storie;
  final Event event;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.thumbnail,
    required this.comic,
    required this.storie,
    required this.event,
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
      comic: Comic.fromJson(ValidatorUtils.containsKey(json, 'comics', null)),
      storie:
          Storie.fromJson(ValidatorUtils.containsKey(json, 'stories', null)),
      event: Event.fromJson(ValidatorUtils.containsKey(json, 'events', null)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toJson(),
      'comics': thumbnail.toJson(),
      'stories': thumbnail.toJson(),
      'events': thumbnail.toJson(),
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
        comic,
        storie,
        event,
      ];
}
