part of 'pokemon_detail_cubit.dart';

class PokemonDetailState extends Equatable {
  final ViewData<PokemonDetail, Failure> pokemonDetailState;
  final ViewData<List<EvolutionStep>, Failure> evolutionChainState;
  final String? id;

  const PokemonDetailState({
    this.pokemonDetailState = const ViewInitial(),
    this.evolutionChainState = const ViewInitial(),
    this.id,
  });

  PokemonDetailState copyWith({
    ViewData<PokemonDetail, Failure>? pokemonDetailState,
    ViewData<List<EvolutionStep>, Failure>? evolutionChainState,
    String? id,
  }) {
    return PokemonDetailState(
      pokemonDetailState: pokemonDetailState ?? this.pokemonDetailState,
      evolutionChainState: evolutionChainState ?? this.evolutionChainState,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [pokemonDetailState, evolutionChainState, id];
}
