import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/app/view_model/details/character_detail_event.dart';
import 'package:marvel/app/view_model/details/character_detail_state.dart';

class CharacterDetailBloc extends Bloc<CharDetailEvent, CharDetailState> {
  final MarvelRepository _marvelRepository;
  CharacterDetailBloc(
    this._marvelRepository,
  ) : super(const CharDetailState()) {
    on<CharacteDetailLoad>(_onLoadDetails);
  }

  Future<void> _onLoadDetails(
    CharacteDetailLoad event,
    Emitter<CharDetailState> emit,
  ) async {}
}
