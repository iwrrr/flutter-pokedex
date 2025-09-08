import 'package:pokedex/core/state/data_state.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository _repository;

  GetPokemonsUseCase({required PokemonRepository repository})
    : _repository = repository;

  Future<DataState<List<Pokemon>>> call(int limit, int offset) async {
    final result = await _repository.getPokemons(limit: limit, offset: offset);
    return result.fold(DataFailed.new, DataSuccess.new);
  }
}
