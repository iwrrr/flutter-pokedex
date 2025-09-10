import 'package:pokedex/domain/models/ability.dart';
import 'package:pokedex/domain/models/stat.dart';

class PokemonDetail {
  final int id;
  final String name;
  final int baseExperience;

  final double height;
  final double weight;

  final List<String> types;
  final String artworkUrl;

  final List<Ability> abilities;
  final List<Stat> stats;
  final int statsTotal;

  const PokemonDetail({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.types,
    required this.artworkUrl,
    required this.abilities,
    required this.stats,
    required this.statsTotal,
  });
}
