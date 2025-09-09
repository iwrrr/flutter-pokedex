import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/other_sprites_dto.dart';

part 'sprites_dto.g.dart';

@JsonSerializable()
class SpritesDto {
  final OtherSpritesDto? other;

  const SpritesDto({this.other});

  factory SpritesDto.fromJson(Map<String, dynamic> json) =>
      _$SpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesDtoToJson(this);
}
