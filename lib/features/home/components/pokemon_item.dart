import 'package:flutter/material.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokemonItem extends StatelessWidget {
  final int item;

  const PokemonItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -16,
            right: -16,
            child: Assets.images.pokeball.image(
              width: 100,
              height: 100,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Pokemon $item',
                  style: TextTheme.of(context).titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '#$item',
                        style: TextTheme.of(
                          context,
                        ).bodyLarge?.copyWith(color: Colors.white),
                      ),
                      Container(width: 60, height: 60, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
