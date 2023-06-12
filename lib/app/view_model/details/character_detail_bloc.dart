import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/app/model/response/detail_response_model.dart';

import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/app/view_model/details/character_detail_event.dart';
import 'package:marvel/app/view_model/details/character_detail_state.dart';
import 'package:marvel/core/exceptions/custom.exceptions.dart';

class CharDetailBloc extends Bloc<CharDetailEvent, CharDetailState> {
  final MarvelRepository _marvelRepository;
  CharDetailBloc(
    this._marvelRepository,
  ) : super(const CharDetailState()) {
    on<CharacterComicsDetailLoad>(_onLoadComicDetails);
    on<CharacterSeriesDetailLoad>(_onLoadSerieDetails);
    on<CharacterEventsDetailLoad>(_onLoadEventDetails);
  }

  Future<void> _onLoadComicDetails(
    CharacterComicsDetailLoad event,
    Emitter<CharDetailState> emit,
  ) async {
    emit(state.copyWith(loadingComics: true));
    final res = await _marvelRepository.getComics(id: event.character.id);
    res.fold(
      (CustomException l) async => emit(state.copyWith(loadingComics: false)),
      (DetailResponse<ComicDetail> r) async => emit(state.copyWith(
        loadingComics: false,
        comics: r.results,
      )),
    );
  }

  Future<void> _onLoadSerieDetails(
    CharacterSeriesDetailLoad event,
    Emitter<CharDetailState> emit,
  ) async {
    emit(state.copyWith(loadingSeries: true));
    final res = await _marvelRepository.getSeries(id: event.character.id);
    res.fold(
      (CustomException l) async => emit(state.copyWith(loadingSeries: false)),
      (DetailResponse<SerieDetail> r) async => emit(state.copyWith(
        loadingSeries: false,
        series: r.results,
      )),
    );
  }

  Future<void> _onLoadEventDetails(
    CharacterEventsDetailLoad event,
    Emitter<CharDetailState> emit,
  ) async {
    emit(state.copyWith(loadingEvents: true));
    final res = await _marvelRepository.getEvents(id: event.character.id);
    res.fold(
      (CustomException l) async => emit(state.copyWith(loadingEvents: false)),
      (DetailResponse<EventDetail> r) async => emit(state.copyWith(
        loadingEvents: false,
        events: r.results,
      )),
    );
  }
}
