import 'package:flutter/material.dart';
import 'package:pokedex/features/home/components/pokeball_background.dart';
import 'package:pokedex/features/home/components/pokemon_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          PokeballBackground(),
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Pokedex',
                          style: TextTheme.of(context).headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
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
                    return PokemonItem(item: index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
