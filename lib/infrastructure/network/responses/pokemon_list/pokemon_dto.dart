import 'package:json_annotation/json_annotation.dart';

part 'pokemon_dto.g.dart';

@JsonSerializable()
class PokemonDto {
  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "url")
  final String? url;

  PokemonDto({this.name, this.url});

  factory PokemonDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDtoToJson(this);
}
