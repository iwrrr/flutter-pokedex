import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_dto.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "results")
  final List<PokemonDto>? results;

  PokemonResponse({this.count, this.next, this.previous, this.results});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
