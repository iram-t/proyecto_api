import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_api/screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
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
