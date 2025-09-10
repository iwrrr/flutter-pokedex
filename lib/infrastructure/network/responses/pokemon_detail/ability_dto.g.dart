// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityDto _$AbilityDtoFromJson(Map<String, dynamic> json) => AbilityDto(
  isHidden: json['is_hidden'] as bool?,
  abilityInfo: json['ability'] == null
      ? null
      : AbilityInfoDto.fromJson(json['ability'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AbilityDtoToJson(AbilityDto instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'ability': instance.abilityInfo,
    };
