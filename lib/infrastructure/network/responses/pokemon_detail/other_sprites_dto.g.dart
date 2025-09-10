// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_sprites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherSpritesDto _$OtherSpritesDtoFromJson(Map<String, dynamic> json) =>
    OtherSpritesDto(
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtworkDto.fromJson(
              json['official-artwork'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$OtherSpritesDtoToJson(OtherSpritesDto instance) =>
    <String, dynamic>{'official-artwork': instance.officialArtwork};
