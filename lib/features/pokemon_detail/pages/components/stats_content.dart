import 'package:flutter/material.dart';
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
            child: Column(
              spacing: 16,
              children: [
                StatInfoItem(label: 'HP', value: 45),
                StatInfoItem(label: 'Attack', value: 60),
                StatInfoItem(label: 'Defense', value: 50),
                StatInfoItem(label: 'Sp. Attack', value: 70),
                StatInfoItem(label: 'Sp. Defense', value: 65),
                StatInfoItem(label: 'Speed', value: 55),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
