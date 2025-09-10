import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/extensions/string_ext.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final String image;

  const PokemonItem({super.key, required this.name, required this.image});

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
            CachedNetworkImage(
              imageUrl: image,
              width: 80,
              height: 80,
              placeholder: (context, url) => Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
        Text(name.capitalizeWord()),
      ],
    );
  }
}

class PokemonItemLoading extends StatelessWidget {
  const PokemonItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Assets.images.pokeball.image(
          width: 100,
          height: 100,
          color: Colors.black.withValues(alpha: 0.05),
        ),
        FadeShimmer(
          height: 14,
          width: 50,
          radius: 8,
          fadeTheme: FadeTheme.light,
        ),
      ],
    );
  }
}
