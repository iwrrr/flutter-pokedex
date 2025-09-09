import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_list/pokemon_dto.dart';

class PokemonMapper {
  const PokemonMapper._();

  static Pokemon fromRemote(PokemonDto dto) =>
      Pokemon(name: dto.name ?? '', url: dto.url ?? '');
}
