// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailDto _$PokemonDetailDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      baseExperience: (json['base_experience'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: json['sprites'] == null
          ? null
          : SpritesDto.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => StatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypeSlotDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailDtoToJson(PokemonDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };
