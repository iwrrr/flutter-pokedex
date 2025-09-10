import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/core/state/view_data_ext.dart';
import 'package:pokedex/domain/models/evolution_step.dart';
import 'package:pokedex/features/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/evolution_item.dart';

class EvolutionContent extends StatelessWidget {
  const EvolutionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Evolution Chain',
              style: TextTheme.of(context).titleMedium,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.paddingOf(context).bottom + 16,
          ),
          sliver:
              BlocSelector<
                PokemonDetailCubit,
                PokemonDetailState,
                ViewData<List<EvolutionStep>, Failure>
              >(
                selector: (state) {
                  return state.evolutionChainState;
                },
                builder: (context, state) {
                  return state.when(
                    orElse: () {
                      return SliverList.separated(
                        itemBuilder: (context, index) {
                          return EvolutionItemLoading();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                        itemCount: 10,
                      );
                    },
                    onSuccess: (data) {
                      return SliverList.separated(
                        itemBuilder: (context, index) {
                          return EvolutionItem(
                            fromName: data[index].fromName,
                            fromImage: data[index].fromImage,
                            toName: data[index].toName,
                            toImage: data[index].toImage,
                            level: data[index].minLevel,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                        itemCount: data.length,
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }
}
