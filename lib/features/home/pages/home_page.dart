import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/view_data.dart';
import 'package:pokedex/core/state/view_data_ext.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/features/home/cubit/home_cubit.dart';
import 'package:pokedex/features/home/pages/components/pokeball_background.dart';
import 'package:pokedex/features/home/pages/components/pokemon_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> _isScrolled = ValueNotifier(false);
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    _isScrolled.value = _scrollController.position.pixels > 0;
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getPokemons();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          PokeballBackground(),
          LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape =
                  MediaQuery.orientationOf(context) == Orientation.landscape;

              final screenWidth = MediaQuery.of(context).size.width;

              int crossAxisCount;
              double mainAxisSpacing;
              double crossAxisSpacing;

              if (isLandscape) {
                crossAxisCount = screenWidth > 1200 ? 4 : 3;
                mainAxisSpacing = 12;
                crossAxisSpacing = 12;
              } else {
                crossAxisCount = screenWidth > 600 ? 3 : 2;
                mainAxisSpacing = 16;
                crossAxisSpacing = 16;
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0,
                    pinned: true,
                    floating: true,
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
                            padding: const EdgeInsets.all(16),
                            child: SafeArea(
                              child: Row(
                                children: [
                                  Text(
                                    'Pokedex',
                                    style: TextTheme.of(context).headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  BlocSelector<
                    HomeCubit,
                    HomeState,
                    ViewData<List<Pokemon>, Failure>
                  >(
                    selector: (state) {
                      return state.pokemonsState;
                    },
                    builder: (context, state) {
                      return state.when(
                        onInitial: () {
                          return PokemonGridLoading(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: mainAxisSpacing,
                            crossAxisSpacing: crossAxisSpacing,
                          );
                        },
                        onLoading: (message) {
                          return PokemonGridLoading(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: mainAxisSpacing,
                            crossAxisSpacing: crossAxisSpacing,
                          );
                        },
                        onSuccess: (data) {
                          return PokemonGrid(
                            data: data,
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: mainAxisSpacing,
                            crossAxisSpacing: crossAxisSpacing,
                          );
                        },
                        onError: (error, message) {
                          return SliverPadding(
                            padding: const EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              child: Column(
                                spacing: 16,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Oops! Something went wrong, Error: ${error?.message ?? 'Unknown error'}',
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      context.read<HomeCubit>().getPokemons();
                                    },
                                    child: const Text('Try again'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        orElse: () {
                          return const SliverToBoxAdapter();
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
