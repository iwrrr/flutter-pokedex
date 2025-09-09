import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/infrastructure/network/responses/pokemon_detail/ability_info_dto.dart';

part 'ability_dto.g.dart';

@JsonSerializable()
class AbilityDto {
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  @JsonKey(name: 'ability')
  final AbilityInfoDto? abilityInfo;

  const AbilityDto({this.isHidden, this.abilityInfo});

  factory AbilityDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDtoToJson(this);
}
