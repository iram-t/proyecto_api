import 'package:flutter/material.dart';
import 'package:proyecto_api/models/monsters_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> monsterArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<MonstersResponse> monster = monsterArguments['monster'];
    final int idMonster = monsterArguments['idmonster'] - 1;
    return Scaffold(
      appBar: AppBar(title: Text(monster[idMonster].name)),
      body: Column(
        children: [
          Text(monster[idMonster].elements.join(elementValues.toString())),
          Text(monster[idMonster].weaknesses.toString()),
          Text(monster[idMonster].ailments.toString()),
          // Text(monster[idMonster].description),
          Text(monster[idMonster].description),
        ],
      ),
    );
  }
}
