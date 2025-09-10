// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChainDto _$EvolutionChainDtoFromJson(Map<String, dynamic> json) =>
    EvolutionChainDto(
      chain: EvolutionNodeDto.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionChainDtoToJson(EvolutionChainDto instance) =>
    <String, dynamic>{'chain': instance.chain.toJson()};
