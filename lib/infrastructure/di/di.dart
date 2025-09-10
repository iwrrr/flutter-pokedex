import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/di/di.dart';
import 'package:pokedex/infrastructure/network/services/pokemon_service.dart';

Future<void> initInfrastructure() async {
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        connectTimeout: const Duration(minutes: 1),
      ),
    )..interceptors.add(AwesomeDioInterceptor()),
  );

  sl.registerLazySingleton(() => PokemonService(sl()));
}
