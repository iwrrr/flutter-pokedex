import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/data_state_ext.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemons_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPokemonsUseCase _getPokemonsUseCase;

  HomeCubit({required GetPokemonsUseCase getPokemonsUseCase})
    : _getPokemonsUseCase = getPokemonsUseCase,
      super(HomeState());

  void getPokemons() async {
    emit(state.copyWith(pokemonsState: const ViewLoading()));
    final result = await _getPokemonsUseCase(20, 0);
    emit(state.copyWith(pokemonsState: result.toViewData()));
  }
}
