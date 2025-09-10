import 'package:json_annotation/json_annotation.dart';

part 'species_dto.g.dart';

@JsonSerializable()
class SpeciesDto {
  String? name;
  String? url;

  SpeciesDto({this.name, this.url});

  factory SpeciesDto.fromJson(Map<String, dynamic> json) {
    return _$SpeciesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpeciesDtoToJson(this);
}
