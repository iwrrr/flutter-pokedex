import 'package:json_annotation/json_annotation.dart';

part 'ability_info_dto.g.dart';

@JsonSerializable()
class AbilityInfoDto {
  final String? name;

  const AbilityInfoDto({this.name});

  factory AbilityInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityInfoDtoToJson(this);
}
