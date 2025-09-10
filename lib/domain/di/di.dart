import 'package:pokedex/core/di/di.dart';
import 'package:pokedex/domain/usecases/get_evolution_chain_use_case.dart';
import 'package:pokedex/domain/usecases/get_pokemon_detail_use_case.dart';
import 'package:pokedex/domain/usecases/get_pokemons_use_case.dart';

Future<void> initDomain() async {
  sl.registerLazySingleton(() => GetPokemonsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPokemonDetailUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetEvolutionChainUseCase(repository: sl()));
}
