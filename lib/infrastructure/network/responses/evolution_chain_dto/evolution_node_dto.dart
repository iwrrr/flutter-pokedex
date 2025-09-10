import 'package:json_annotation/json_annotation.dart';

import 'evolution_detail_dto.dart';
import 'species_dto.dart';

part 'evolution_node_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class EvolutionNodeDto {
  @JsonKey(name: 'evolution_details')
  List<EvolutionDetailDto>? evolutionDetails;
  @JsonKey(name: 'evolves_to')
  List<EvolutionNodeDto>? evolvesTo;
  SpeciesDto? species;

  EvolutionNodeDto({this.evolutionDetails, this.evolvesTo, this.species});

  factory EvolutionNodeDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionNodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionNodeDtoToJson(this);
}
