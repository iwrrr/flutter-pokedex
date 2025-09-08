import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjection();

  runApp(const App());
}
