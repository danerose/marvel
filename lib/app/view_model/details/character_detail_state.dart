import 'package:equatable/equatable.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';
import 'package:marvel/core/enum/exceptions.enum.dart';

class CharDetailState extends Equatable {
  const CharDetailState({
    this.loadingComics = false,
    this.loadingSeries = false,
    this.loadingEvents = false,
    this.comics = const [],
    this.series = const [],
    this.events = const [],
    this.errorComics = ExceptionEnum.none,
    this.errorSeries = ExceptionEnum.none,
    this.errorEvents = ExceptionEnum.none,
  });

  final bool loadingComics;
  final bool loadingSeries;
  final bool loadingEvents;
  final List<ComicDetail> comics;
  final List<SerieDetail> series;
  final List<EventDetail> events;
  final ExceptionEnum errorComics;
  final ExceptionEnum errorSeries;
  final ExceptionEnum errorEvents;

  CharDetailState copyWith({
    bool? loadingComics,
    bool? loadingSeries,
    bool? loadingEvents,
    List<ComicDetail>? comics,
    List<SerieDetail>? series,
    List<EventDetail>? events,
    ExceptionEnum? errorComics,
    ExceptionEnum? errorSeries,
    ExceptionEnum? errorEvents,
  }) {
    return CharDetailState(
      loadingComics: loadingComics ?? this.loadingComics,
      loadingSeries: loadingSeries ?? this.loadingSeries,
      loadingEvents: loadingEvents ?? this.loadingEvents,
      comics: comics ?? this.comics,
      series: series ?? this.series,
      events: events ?? this.events,
      errorComics: errorComics ?? this.errorComics,
      errorSeries: errorSeries ?? this.errorSeries,
      errorEvents: errorEvents ?? this.errorEvents,
    );
  }

  @override
  List<Object?> get props => [
        loadingComics,
        loadingSeries,
        loadingEvents,
        comics,
        series,
        events,
        errorComics,
        errorSeries,
        errorEvents,
      ];
}
