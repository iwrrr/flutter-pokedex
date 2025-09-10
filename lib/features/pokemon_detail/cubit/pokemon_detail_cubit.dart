import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/data_state_ext.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/domain/models/evolution_step.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/domain/usecases/get_evolution_chain_use_case.dart';
import 'package:pokedex/domain/usecases/get_pokemon_detail_use_case.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetailUseCase _getPokemonDetailUseCase;
  final GetEvolutionChainUseCase _getEvolutionChainUseCase;

  PokemonDetailCubit({
    required GetPokemonDetailUseCase getPokemonDetailUseCase,
    required GetEvolutionChainUseCase getEvolutionChainUseCase,
  }) : _getPokemonDetailUseCase = getPokemonDetailUseCase,
       _getEvolutionChainUseCase = getEvolutionChainUseCase,
       super(PokemonDetailState());

  void setId(String id) {
    emit(state.copyWith(id: id));
  }

  void getPokemonDetail() async {
    if (state.id == null) return;
    emit(state.copyWith(pokemonDetailState: const ViewLoading()));
    final result = await _getPokemonDetailUseCase(state.id!);
    emit(state.copyWith(pokemonDetailState: result.toViewData()));
  }

  void getEvolutionChain() async {
    if (state.id == null) return;
    emit(state.copyWith(evolutionChainState: const ViewLoading()));
    final result = await _getEvolutionChainUseCase(state.id!);
    emit(state.copyWith(evolutionChainState: result.toViewData()));
  }
}
