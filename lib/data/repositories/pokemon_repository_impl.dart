import 'package:dartz/dartz.dart';
import 'package:pokedex/core/exception/error_mapper.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/data/mappers/pokemon_detail_mapper.dart';
import 'package:pokedex/data/mappers/pokemon_mapper.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/infrastructure/network/services/pokemon_service.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonService _pokemonService;

  PokemonRepositoryImpl({required PokemonService pokemonService})
    : _pokemonService = pokemonService;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _pokemonService.getPokemons(limit, offset);
      return Right(
        response.results?.map(PokemonMapper.fromRemote).toList() ?? [],
      );
    } catch (e, stack) {
      return Left(ErrorMapper.map(e, stackTrace: stack));
    }
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail({
    required String id,
  }) async {
    try {
      final response = await _pokemonService.getPokemonDetail(id);
      return Right(PokemonDetailMapper.fromRemote(response));
    } catch (e, stack) {
      return Left(ErrorMapper.map(e, stackTrace: stack));
    }
  }
}
