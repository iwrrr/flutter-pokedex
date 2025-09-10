import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/core/state/view_data_ext.dart';
import 'package:pokedex/domain/models/pokemon_detail.dart';
import 'package:pokedex/features/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/stat_info_item.dart';

class StatsContent extends StatelessWidget {
  const StatsContent({super.key});

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
                            (index) => StatInfoItemLoading(),
                          ),
                        );
                      },
                      onSuccess: (data) {
                        return Column(
                          spacing: 16,
                          children: data.stats.map((stat) {
                            return StatInfoItem(
                              label: stat.name,
                              value: stat.base.toDouble(),
                            );
                          }).toList(),
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
