import 'package:dartz/dartz.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/domain/models/evolution_step.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, PokemonDetail>> getPokemonDetail({required String id});

  Future<Either<Failure, List<EvolutionStep>>> getEvolutionChain({
    required String id,
  });
}
