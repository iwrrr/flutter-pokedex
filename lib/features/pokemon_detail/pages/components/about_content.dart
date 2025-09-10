import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/extensions/string_ext.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/core/state/view_data_ext.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/features/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/about_info_item.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        return Column(
                          spacing: 16,
                          children: List.generate(
                            4,
                            (index) => AboutInfoItemLoading(),
                          ),
                        );
                      },
                      onSuccess: (data) {
                        return Column(
                          spacing: 16,
                          children: [
                            AboutInfoItem(
                              label: 'Height',
                              value: data.height.toString(),
                            ),
                            AboutInfoItem(
                              label: 'Weight',
                              value: data.weight.toString(),
                            ),
                            AboutInfoItem(
                              label: 'Abilities',
                              value: data.abilities
                                  .map(
                                    (ability) => ability.name.capitalizeWord(),
                                  )
                                  .join(', '),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
          ),
        ),
      ],
    );
  }
}
