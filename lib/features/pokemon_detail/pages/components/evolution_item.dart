import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/pokemon_item.dart';

class EvolutionItem extends StatelessWidget {
  final String fromName;
  final String fromImage;
  final String toName;
  final String toImage;
  final int? level;

  const EvolutionItem({
    super.key,
    required this.fromName,
    required this.fromImage,
    required this.toName,
    required this.toImage,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PokemonItem(name: fromName, image: fromImage),
        Column(
          children: [
            Icon(Icons.arrow_forward_rounded),
            if (level != null) ...[
              Text('Lvl $level', style: TextTheme.of(context).bodySmall),
            ],
          ],
        ),
        PokemonItem(name: toName, image: toImage),
      ],
    );
  }
}

class EvolutionItemLoading extends StatelessWidget {
  const EvolutionItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PokemonItemLoading(),
        Column(
          children: [Icon(Icons.arrow_forward_rounded), SizedBox.shrink()],
        ),
        PokemonItemLoading(),
      ],
    );
  }
}
