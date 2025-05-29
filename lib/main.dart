import 'package:proyecto_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/screens/screens.dart';
import 'providers/monsters_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

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

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Monster Hunter',
      initialRoute: 'home',
      routes: {
        'home': (_) => const Home(),
        'details': (_) => const DetailsScreen(),
      },
    );
  }
}
