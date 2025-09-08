import 'package:dartz/dartz.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/domain/models/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons({
    required int limit,
    required int offset,
  });
}
