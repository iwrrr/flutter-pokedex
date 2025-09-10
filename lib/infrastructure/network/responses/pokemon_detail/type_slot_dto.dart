import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/type_info_dto.dart';

part 'type_slot_dto.g.dart';

@JsonSerializable()
class TypeSlotDto {
  @JsonKey(name: 'type')
  final TypeInfoDto? typeInfo;

  const TypeSlotDto({this.typeInfo});

  factory TypeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeSlotDtoToJson(this);
}
