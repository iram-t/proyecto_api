import 'package:flutter/material.dart';
import 'package:proyecto_api/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarHome(),
    );
  }
}
