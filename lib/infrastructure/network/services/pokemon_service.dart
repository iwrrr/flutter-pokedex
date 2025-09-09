import 'package:dio/dio.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/pokemon_detail_dto.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokemonService {
  factory PokemonService(Dio dio) = _PokemonService;

  @GET("/pokemon")
  Future<PokemonResponse> getPokemons(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET("/pokemon/{id}")
  Future<PokemonDetailDto> getPokemonDetail(@Path("id") String id);
}
