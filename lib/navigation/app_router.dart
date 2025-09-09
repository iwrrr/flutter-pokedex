import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/di/di.dart';
import 'package:pokedex/features/home/cubit/home_cubit.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:pokedex/features/pokemon_detail/pages/pokemon_detail_page.dart';
import 'package:pokedex/navigation/app_routes.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.homePath,
    routes: [
      GoRoute(
        path: AppRoutes.homePath,
        name: AppRoutes.homeName,
        pageBuilder: (context, state) => CupertinoPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => HomeCubit(getPokemonsUseCase: sl()),
            child: const HomePage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.pokemonDetailPath,
        name: AppRoutes.pokemonDetailName,
        pageBuilder: (context, state) => CupertinoPage(
          key: state.pageKey,
          child: PokemonDetailPage(id: state.pathParameters['id']!),
        ),
      ),
    ],
  );
}
