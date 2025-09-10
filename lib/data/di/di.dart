import 'package:pokedex/core/di/di.dart';
import 'package:pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

Future<void> initData() async {
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(pokemonService: sl()),
  );
}
