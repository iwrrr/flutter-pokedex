import 'package:json_annotation/json_annotation.dart';

part 'official_artwork_dto.g.dart';

@JsonSerializable()
class OfficialArtworkDto {
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  const OfficialArtworkDto({this.frontDefault});

  factory OfficialArtworkDto.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkDtoToJson(this);
}
