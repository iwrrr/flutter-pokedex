import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/extensions/string_ext.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/core/state/view_data_ext.dart';
import 'package:pokedex/domain/extensions/pokemon_ext.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/features/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/chip_type.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokemonHeader extends StatelessWidget {
  const PokemonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:
          BlocSelector<
            PokemonDetailCubit,
            PokemonDetailState,
            ViewData<PokemonDetail, Failure>
          >(
            selector: (state) {
              return state.pokemonDetailState;
            },
            builder: (context, state) {
              return state.when(
                orElse: () {
                  return PokemonHeaderContentLoading();
                },
                onSuccess: (data) {
                  return PokemonHeaderContent(
                    name: data.name.capitalizeWord(),
                    types: data.types,
                    number: data.number,
                    imageUrl: data.artworkUrl,
                  );
                },
              );
            },
          ),
    );
  }
}

class PokemonHeaderContent extends StatelessWidget {
  final String name;
  final List<String> types;
  final String number;
  final String imageUrl;

  const PokemonHeaderContent({
    required this.name,
    required this.types,
    required this.number,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 56,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      name,
                      style: TextTheme.of(
                        context,
                      ).headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: types
                          .map((type) => ChipType(type: type.capitalizeWord()))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Text(
                '#$number',
                style: TextTheme.of(
                  context,
                ).headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              right: -30,
              bottom: 0,
              child: Assets.images.pokeball.image(
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
            Align(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            CachedNetworkImage(imageUrl: imageUrl, width: 200, height: 200),
          ],
        ),
      ],
    );
  }
}

class PokemonHeaderContentLoading extends StatelessWidget {
  const PokemonHeaderContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 56,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      width: 150,
                      height: 32,
                      radius: 50,
                      fadeTheme: FadeTheme.light,
                    ),
                    FadeShimmer(
                      width: 50,
                      height: 20,
                      radius: 50,
                      fadeTheme: FadeTheme.light,
                    ),
                  ],
                ),
              ),
              FadeShimmer(
                width: 50,
                height: 24,
                radius: 50,
                fadeTheme: FadeTheme.light,
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              right: -30,
              bottom: 0,
              child: Assets.images.pokeball.image(
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
            Align(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            FadeShimmer(
              width: 200,
              height: 200,
              radius: 200,
              fadeTheme: FadeTheme.light,
            ),
          ],
        ),
      ],
    );
  }
}
