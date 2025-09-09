import 'package:flutter/material.dart';
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
            child: Column(
              spacing: 16,
              children: [
                AboutInfoItem(label: 'Species', value: '{species}'),
                AboutInfoItem(label: 'Height', value: '{height}'),
                AboutInfoItem(label: 'Weight', value: '{weight}'),
                AboutInfoItem(label: 'Abilities', value: '{abilities}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
