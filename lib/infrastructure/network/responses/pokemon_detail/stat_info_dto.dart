import 'package:json_annotation/json_annotation.dart';

part 'stat_info_dto.g.dart';

@JsonSerializable()
class StatInfoDto {
  final String? name;

  const StatInfoDto({this.name});

  factory StatInfoDto.fromJson(Map<String, dynamic> json) =>
      _$StatInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StatInfoDtoToJson(this);
}
