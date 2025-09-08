import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/extensions/string_ext.dart';
import 'package:pokedex/domain/extensions/pokemon_ext.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon item;
  final Function(Pokemon pokemon) onTap;

  const PokemonItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -16,
              right: -16,
              child: Assets.images.pokeball.image(
                width: 100,
                height: 100,
                color: Colors.black.withValues(alpha: 0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.name.capitalizeWord(),
                    style: TextTheme.of(context).titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            '#${item.number}',
                            style: TextTheme.of(context).bodyLarge,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonItemLoading extends StatelessWidget {
  const PokemonItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -16,
            right: -16,
            child: Assets.images.pokeball.image(
              width: 100,
              height: 100,
              color: Colors.black.withValues(alpha: 0.05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  height: 16,
                  width: 100,
                  radius: 4,
                  fadeTheme: FadeTheme.light,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FadeShimmer(
                        height: 16,
                        width: 50,
                        radius: 4,
                        fadeTheme: FadeTheme.light,
                      ),
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
