import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/domain/extensions/pokemon_ext.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/features/home/pages/components/pokemon_item.dart';
import 'package:pokedex/navigation/app_routes.dart';

class PokemonGrid extends StatelessWidget {
  final List<Pokemon> data;

  const PokemonGrid({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return PokemonItem(
              item: data[index],
              onTap: (pokemon) {
                context.pushNamed(
                  AppRoutes.pokemonDetailName,
                  pathParameters: {'id': pokemon.id.toString()},
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PokemonGridLoading extends StatelessWidget {
  const PokemonGridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return PokemonItemLoading();
          },
        ),
      ),
    );
  }
}
