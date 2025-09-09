// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatDto _$StatDtoFromJson(Map<String, dynamic> json) => StatDto(
  baseStat: (json['base_stat'] as num?)?.toInt(),
  effort: (json['effort'] as num?)?.toInt(),
  statInfo: json['stat'] == null
      ? null
      : StatInfoDto.fromJson(json['stat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatDtoToJson(StatDto instance) => <String, dynamic>{
  'base_stat': instance.baseStat,
  'effort': instance.effort,
  'stat': instance.statInfo,
};
