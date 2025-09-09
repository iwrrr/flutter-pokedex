import 'package:pokedex/core/state/data_state.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository _repository;

  GetPokemonDetailUseCase({required PokemonRepository repository})
    : _repository = repository;

  Future<DataState<PokemonDetail>> call(String id) async {
    final result = await _repository.getPokemonDetail(id: id);
    return result.fold(DataFailed.new, DataSuccess.new);
  }
}
