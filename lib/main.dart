import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/screens/monster_details.dart';
import 'package:proyecto_api/screens/screens.dart';
import 'providers/monsters_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MonstersProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster Hunter',
      initialRoute: 'home',
      routes: {
        'home': (_) => const Home(),
        'details': (_) => const DetailsScreen(),
      },
    );
  }
}
