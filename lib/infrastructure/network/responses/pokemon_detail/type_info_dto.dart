import 'package:json_annotation/json_annotation.dart';

part 'type_info_dto.g.dart';

@JsonSerializable()
class TypeInfoDto {
  final String? name;

  const TypeInfoDto({this.name});

  factory TypeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoDtoToJson(this);
}
