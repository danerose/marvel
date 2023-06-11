import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/character/character_model.dart';

abstract class CharacterState extends Equatable {}

class CharacterInitial extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoadingList extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoadedList extends CharacterState {
  CharacterLoadedList({required this.characters});
  final List<Character> characters;
  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {
  @override
  List<Object?> get props => [];
}
