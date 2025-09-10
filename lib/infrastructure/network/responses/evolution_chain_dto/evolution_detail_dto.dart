import 'package:json_annotation/json_annotation.dart';

part 'evolution_detail_dto.g.dart';

@JsonSerializable()
class EvolutionDetailDto {
  @JsonKey(name: 'min_level')
  int? minLevel;

  EvolutionDetailDto({this.minLevel});

  factory EvolutionDetailDto.fromJson(Map<String, dynamic> json) {
    return _$EvolutionDetailDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EvolutionDetailDtoToJson(this);
}
