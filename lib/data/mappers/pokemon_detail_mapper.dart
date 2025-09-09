import 'package:pokedex/domain/models/ability.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/domain/models/stat.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/pokemon_detail_dto.dart';

class PokemonDetailMapper {
  const PokemonDetailMapper._();

  static PokemonDetail fromRemote(PokemonDetailDto dto) {
    final typesDomain = dto.types?.map((e) => e.typeInfo?.name).toList() ?? [];

    final abilitiesDomain = dto.abilities
        ?.map(
          (a) => Ability(
            name: a.abilityInfo?.name ?? '',
            isHidden: a.isHidden ?? false,
          ),
        )
        .toList();

    final statsDomain = dto.stats
        ?.map(
          (s) => Stat(
            name: _mapStatName(s.statInfo?.name ?? ''),
            base: s.baseStat ?? 0,
            effort: s.effort ?? 0,
          ),
        )
        .toList();

    final statsTotal = statsDomain?.fold<int>(0, (sum, s) => sum + s.base) ?? 0;

    return PokemonDetail(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      baseExperience: dto.baseExperience ?? 0,
      height: _dmToCm(dto.height ?? 0),
      weight: _hgToKg(dto.weight ?? 0),
      types: typesDomain.map((e) => e ?? '').toList(),
      artworkUrl: dto.sprites?.other?.officialArtwork?.frontDefault ?? '',
      abilities: abilitiesDomain ?? [],
      stats: statsDomain ?? [],
      statsTotal: statsTotal,
    );
  }

  static double _dmToCm(int dm) => dm * 10.0;
  static double _hgToKg(int hg) => hg / 10.0;

  static String _mapStatName(String? raw) {
    switch (raw ?? '') {
      case 'hp':
        return 'Hp';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp. Attack';
      case 'special-defense':
        return 'Sp. Defense';
      case 'speed':
        return 'Speed';
      default:
        return 'Unknown';
    }
  }
}
