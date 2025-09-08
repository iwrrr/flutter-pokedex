import 'package:pokedex/core/di/di.dart';
import 'package:pokedex/domain/usecases/get_pokemons_use_case.dart';

Future<void> initDomain() async {
  sl.registerLazySingleton(() => GetPokemonsUseCase(repository: sl()));
}
