import 'package:flutter/material.dart';
import 'package:proyecto_api/models/monsters_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  String getWeaknessImage(String weaknessName) {
    switch (weaknessName) {
      case 'FIRE':
        return 'assets/fire.png';
      case 'WATER':
        return 'assets/water.png';
      case 'THUNDER':
        return 'assets/thunder.png';
      case 'ICE':
        return 'assets/ice.png';
      case 'DRAGON':
        return 'assets/dragon.png';
      case 'POISON':
        return 'assets/poison.png';
      case 'SLEEP':
        return 'assets/sleep.png';
      case 'PARALYSIS':
        return 'assets/paralysis.png';
      case 'BLAST':
        return 'assets/blast.png';
      case 'STUN':
        return 'assets/stun.png';
      // Añadir más casos según sea necesario
      default:
        return 'assets/default.png'; // Imagen predeterminada para debilidades desconocidas
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> monsterArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<MonstersResponse> monster = monsterArguments['monster'];
    int idMonster = monsterArguments['idmonster'] - 1;
    if (idMonster >= 46) {
      idMonster -= 2;
    }
    return Scaffold(
      appBar: AppBar(title: Text(monster[idMonster].name)),
      body: Column(
        children: [
          Text(monster[idMonster].name),
          Text(monster[idMonster].species),
          Text(monster[idMonster].description),
          Text(
            monster[idMonster]
                .elements
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')
                .replaceAll('Element.', ''),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var weakness in monster[idMonster].weaknesses)
                (weakness.condition == null)
                    ? Expanded(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(getWeaknessImage(
                                weakness.element
                                    .toString()
                                    .replaceAll('Element.', ''),
                              )),
                              height: 30,
                            ),
                            Column(
                              children: List.generate(
                                weakness.stars,
                                (index) =>
                                    const Icon(Icons.star, color: Colors.amber),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var weakness in monster[idMonster].weaknesses)
                (weakness.condition != null)
                    ? Column(
                        children: [
                          Image(
                            image: AssetImage(getWeaknessImage(
                              weakness.element
                                  .toString()
                                  .replaceAll('Element.', ''),
                            )),
                            height: 30,
                          ),
                          Column(
                            children: List.generate(
                              weakness.stars,
                              (index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                            ),
                          ),
                          Row(
                            children: [Text(weakness.condition.toString())],
                          )
                        ],
                      )
                    : Container()
            ],
          ),
          Text(monster[idMonster].locations.toString()),
        ],
      ),
    );
  }
}
