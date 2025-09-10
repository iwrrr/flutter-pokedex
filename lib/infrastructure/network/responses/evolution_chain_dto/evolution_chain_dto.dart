import 'package:json_annotation/json_annotation.dart';

import 'evolution_node_dto.dart';

part 'evolution_chain_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class EvolutionChainDto {
  final EvolutionNodeDto chain;

  EvolutionChainDto({required this.chain});

  factory EvolutionChainDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainDtoToJson(this);
}
