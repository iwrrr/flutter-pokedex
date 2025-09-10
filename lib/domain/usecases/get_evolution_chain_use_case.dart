import 'package:pokedex/core/state/data_state.dart';
import 'package:pokedex/domain/models/evolution_step.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetEvolutionChainUseCase {
  final PokemonRepository _repository;

  GetEvolutionChainUseCase({required PokemonRepository repository})
    : _repository = repository;

  Future<DataState<List<EvolutionStep>>> call(String id) async {
    final result = await _repository.getEvolutionChain(id: id);
    return result.fold(DataFailed.new, DataSuccess.new);
  }
}
