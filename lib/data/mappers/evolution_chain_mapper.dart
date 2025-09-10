import 'package:pokedex/domain/models/evolution_step.dart';
import 'package:pokedex/infrastructure/network/responses/evolution_chain_dto/evolution_chain_dto.dart';
import 'package:pokedex/infrastructure/network/responses/evolution_chain_dto/evolution_node_dto.dart';

class EvolutionChainMapper {
  const EvolutionChainMapper._();

  static List<EvolutionStep> fromRemote(EvolutionChainDto dto) {
    final steps = <EvolutionStep>[];

    void walk(EvolutionNodeDto node) {
      for (final evolve in node.evolvesTo ?? []) {
        final detail = evolve.evolutionDetails?.isNotEmpty
            ? evolve.evolutionDetails.first
            : null;

        steps.add(
          EvolutionStep(
            fromName: node.species?.name ?? '',
            toName: evolve.species?.name ?? '',
            fromImage: _spriteUrl(node.species?.url ?? ''),
            toImage: _spriteUrl(evolve.species?.url ?? ''),
            minLevel: detail?.minLevel,
          ),
        );

        walk(evolve);
      }
    }

    walk(dto.chain);
    return steps;
  }

  static String _spriteUrl(String url) {
    final parts = url.split('/');
    final id = parts[parts.length - 2];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }
}
