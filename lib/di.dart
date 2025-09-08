import 'package:pokedex/data/di/di.dart';
import 'package:pokedex/domain/di/di.dart';
import 'package:pokedex/infrastructure/di/di.dart';

Future<void> initInjection() async {
  await initInfrastructure();
  await initData();
  await initDomain();
}
