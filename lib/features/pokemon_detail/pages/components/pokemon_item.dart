import 'package:flutter/material.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Assets.images.pokeball.image(
              width: 100,
              height: 100,
              color: Colors.black.withValues(alpha: 0.05),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        Text('{pokemon_name}'),
      ],
    );
  }
}
