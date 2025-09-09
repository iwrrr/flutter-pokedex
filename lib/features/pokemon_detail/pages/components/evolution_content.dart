import 'package:flutter/material.dart';
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
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return EvolutionItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
