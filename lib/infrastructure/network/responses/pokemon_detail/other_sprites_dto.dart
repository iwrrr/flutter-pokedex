import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/official_artwork_dto.dart';

part 'other_sprites_dto.g.dart';

@JsonSerializable()
class OtherSpritesDto {
  @JsonKey(name: 'official-artwork')
  final OfficialArtworkDto? officialArtwork;

  const OtherSpritesDto({this.officialArtwork});

  factory OtherSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtherSpritesDtoToJson(this);
}
