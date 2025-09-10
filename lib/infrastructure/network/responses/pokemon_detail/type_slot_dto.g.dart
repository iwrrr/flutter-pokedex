// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_slot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeSlotDto _$TypeSlotDtoFromJson(Map<String, dynamic> json) => TypeSlotDto(
  typeInfo: json['type'] == null
      ? null
      : TypeInfoDto.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TypeSlotDtoToJson(TypeSlotDto instance) =>
    <String, dynamic>{'type': instance.typeInfo};
