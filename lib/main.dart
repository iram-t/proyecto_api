import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/screens/screens.dart';
import 'providers/monsters_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MonstersProvider(),
        )
      ],
      child: Home(),
    );
  }
}
