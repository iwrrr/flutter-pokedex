// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_node_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionNodeDto _$EvolutionNodeDtoFromJson(Map<String, dynamic> json) =>
    EvolutionNodeDto(
      evolutionDetails: (json['evolution_details'] as List<dynamic>?)
          ?.map((e) => EvolutionDetailDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolvesTo: (json['evolves_to'] as List<dynamic>?)
          ?.map((e) => EvolutionNodeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : SpeciesDto.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionNodeDtoToJson(EvolutionNodeDto instance) =>
    <String, dynamic>{
      'evolution_details': instance.evolutionDetails
          ?.map((e) => e.toJson())
          .toList(),
      'evolves_to': instance.evolvesTo?.map((e) => e.toJson()).toList(),
      'species': instance.species?.toJson(),
    };
