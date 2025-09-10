// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpritesDto _$SpritesDtoFromJson(Map<String, dynamic> json) => SpritesDto(
  other: json['other'] == null
      ? null
      : OtherSpritesDto.fromJson(json['other'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpritesDtoToJson(SpritesDto instance) =>
    <String, dynamic>{'other': instance.other};
