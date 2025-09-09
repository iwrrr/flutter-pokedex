import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/ability_dto.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/sprites_dto.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/stat_dto.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/type_slot_dto.dart';

part 'pokemon_detail_dto.g.dart';

@JsonSerializable()
class PokemonDetailDto {
  final int? id;
  final String? name;

  @JsonKey(name: 'base_experience')
  final int? baseExperience;

  final int? height;
  final int? weight;

  final List<AbilityDto>? abilities;
  final SpritesDto? sprites;
  final List<StatDto>? stats;
  final List<TypeSlotDto>? types;

  const PokemonDetailDto({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.abilities,
    this.sprites,
    this.stats,
    this.types,
  });

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailDtoToJson(this);
}
