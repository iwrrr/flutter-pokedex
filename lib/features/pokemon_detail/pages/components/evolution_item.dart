import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/pokemon_item.dart';

class EvolutionItem extends StatelessWidget {
  const EvolutionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PokemonItem(),
        Column(
          children: [
            Icon(Icons.arrow_forward_rounded),
            Text('Lvl {lv}', style: TextTheme.of(context).bodySmall),
          ],
        ),
        PokemonItem(),
      ],
    );
  }
}
