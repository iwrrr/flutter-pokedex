part of 'pokemon_detail_cubit.dart';

class PokemonDetailState extends Equatable {
  final ViewData<PokemonDetail, Failure> pokemonDetailState;
  final String? id;

  const PokemonDetailState({
    this.pokemonDetailState = const ViewInitial(),
    this.id,
  });

  PokemonDetailState copyWith({
    ViewData<PokemonDetail, Failure>? pokemonDetailState,
    String? id,
  }) {
    return PokemonDetailState(
      pokemonDetailState: pokemonDetailState ?? this.pokemonDetailState,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [pokemonDetailState, id];
}
