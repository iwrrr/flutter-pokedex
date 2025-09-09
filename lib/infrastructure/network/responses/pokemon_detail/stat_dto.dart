import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/stat_info_dto.dart';

part 'stat_dto.g.dart';

@JsonSerializable()
class StatDto {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  @JsonKey(name: 'stat')
  final StatInfoDto? statInfo;

  const StatDto({this.baseStat, this.effort, this.statInfo});

  factory StatDto.fromJson(Map<String, dynamic> json) =>
      _$StatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StatDtoToJson(this);
}
