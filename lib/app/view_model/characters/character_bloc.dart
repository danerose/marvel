import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/app/model/response/character_response_model.dart';

import 'package:marvel/app/view_model/characters/character_event.dart';
import 'package:marvel/app/view_model/characters/character_state.dart';

import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final MarvelRepository _marvelRepository;
  CharacterBloc(this._marvelRepository) : super(CharacterInitial()) {
    on<CharacterLoadList>(_onCharacterLoadList);
  }

  Future<void> _onCharacterLoadList(
    CharacterLoadList event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoadingList());
    final res = await _marvelRepository.getCharacters();
    res.fold(
      (CustomException l) => emit(CharacterError()),
      (CharacterResponse r) => emit(CharacterLoadedList(
        characters: r.characters,
      )),
    );
  }
}
