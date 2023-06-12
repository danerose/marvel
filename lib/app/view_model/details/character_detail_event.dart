import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/character/character_model.dart';

@immutable
abstract class CharDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacteDetailLoad extends CharDetailEvent {
  CharacteDetailLoad({required this.character});
  final Character character;
}

class CharacterComicsDetailLoad extends CharDetailEvent {
  CharacterComicsDetailLoad({required this.character});
  final Character character;
}

class CharacterSeriesDetailLoad extends CharDetailEvent {
  CharacterSeriesDetailLoad({required this.character});
  final Character character;
}

class CharacterEventsDetailLoad extends CharDetailEvent {
  CharacterEventsDetailLoad({required this.character});
  final Character character;
}
