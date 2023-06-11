import 'package:equatable/equatable.dart';

class CharacterDetailState extends Equatable {
  const CharacterDetailState({
    this.loading = false,
  });

  final bool loading;

  CharacterDetailState copyWith({
    bool? loading,
  }) {
    return CharacterDetailState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [loading];
}
