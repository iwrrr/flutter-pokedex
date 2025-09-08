import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/home_page.dart';
import 'package:pokedex/navigation/app_routes.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.homePath,
    routes: [
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
