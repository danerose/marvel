import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/core/utils/validators.util.dart';

class CharacterResponse extends Equatable {
  final int code;
  final List<Character> characters;

  const CharacterResponse({
    required this.code,
    required this.characters,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic>? json) {
    return CharacterResponse(
      code: ValidatorUtils.containsKey<int>(json, 'code', 0),
      characters: List.from(
        ValidatorUtils.containsKey(
          json?['data'],
          'results',
          [].map((e) => Character.fromJson(e)),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [code, characters];
}
