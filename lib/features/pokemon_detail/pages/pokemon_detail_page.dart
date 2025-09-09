import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/about_content.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/chip_type.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/evolution_content.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/moves_content.dart';
import 'package:pokedex/features/pokemon_detail/pages/components/stats_content.dart';
import 'package:pokedex/resources/assets.gen.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PokemonDetailPage extends StatefulWidget {
  final String id;

  const PokemonDetailPage({required this.id, super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final ValueNotifier<bool> _isScrolled;
  late final ScrollController _scrollController;

  void _onScroll() {
    _isScrolled.value = _scrollController.position.pixels > 0;
  }

  @override
  void initState() {
    super.initState();
    _isScrolled = ValueNotifier(false);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _isScrolled.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: DecoratedSliver(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  sliver: MultiSliver(
                    children: [
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        scrolledUnderElevation: 0,
                        pinned: true,
                        floating: true,
                        primary: true,
                        flexibleSpace: ValueListenableBuilder(
                          valueListenable: _isScrolled,
                          builder: (context, isScrolled, child) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: isScrolled
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8,
                                  right: 16,
                                  bottom: 16,
                                ),
                                child: SafeArea(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        icon: const Icon(Icons.arrow_back),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(child: PokemonHeader()),
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        scrolledUnderElevation: 0,
                        pinned: true,
                        primary: false,
                        flexibleSpace: TabBar(
                          tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Stats'),
                            Tab(text: 'Evolution'),
                            Tab(text: 'Moves'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return TabBarView(
                children: [
                  AboutContent(),
                  StatsContent(),
                  EvolutionContent(),
                  MovesContent(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PokemonHeader extends StatelessWidget {
  const PokemonHeader({super.key});

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
                    Text('{pokemon_name}'),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [ChipType(), ChipType(), ChipType()],
                    ),
                  ],
                ),
              ),
              Text('{pokemon_number}'),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
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
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Assets.images.pokeball.image(
                width: 200,
                height: 200,
                color: Colors.black.withValues(alpha: 0.05),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
