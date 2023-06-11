import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/app/view_model/characters/character_event.dart';
import 'package:marvel/app/view_model/details/character_detail_state.dart';

class CharacterDetailBloc extends Bloc<CharacterEvent, CharacterDetailState> {
  CharacterDetailBloc() : super(const CharacterDetailState()) {}
}
