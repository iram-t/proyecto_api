import 'package:flutter/material.dart';
import 'package:proyecto_api/models/database/favorites_model.dart';
import 'package:proyecto_api/models/response/monsters_response.dart';

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
      default:
        return 'assets/default.png'; // Imagen predeterminada para debilidades desconocidas
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> monsterArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (monsterArguments['fav'] == true) {
      MonstersResponse monster = monsterArguments['monster'];

      return Scaffold(
        appBar: AppBar(title: Text(monster.name)),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
            ),
            Text(
              monster.name,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              monster.species,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(height: 40),
            Center(
              child: Text(monster.description),
            ),
            const Divider(height: 40),
            Text(
              monster.elements
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('Element.', ''),
            ),
            const Divider(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var weakness in monster.weaknesses)
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
                                  (index) => const Icon(Icons.star,
                                      color: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container()
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var weakness in monster.weaknesses)
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
                              children: [
                                Text(
                                  weakness.condition.toString(),
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          ],
                        )
                      : Container()
              ],
            ),
            const Divider(height: 30),
            Column(
              children: [
                const Text('Locations:'),
                for (var location in monster.locations)
                  (location.name.isNotEmpty)
                      ? Column(
                          children: [Text(location.name)],
                        )
                      : const Column(
                          children: [Text('No locations')],
                        )
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black26),
              child: const Text('Eliminar de favoritos'),
              onPressed: () {
                deleteFavorite(monster.id);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      );
    } else {
      List<MonstersResponse> monster = monsterArguments['monster'];
      int idMonster = monsterArguments['idmonster'] - 1;
      if (idMonster >= 46) {
        idMonster -= 2;
      }
      return Scaffold(
        appBar: AppBar(title: Text(monster[idMonster].name)),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
            ),
            Text(
              monster[idMonster].name,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              monster[idMonster].species,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(height: 40),
            Center(
              child: Text(monster[idMonster].description),
            ),
            const Divider(height: 40),
            Text(
              monster[idMonster]
                  .elements
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('Element.', ''),
            ),
            const Divider(height: 40),
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
                                  (index) => const Icon(Icons.star,
                                      color: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container()
              ],
            ),
            const SizedBox(height: 20),
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
                              children: [
                                Text(
                                  weakness.condition.toString(),
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          ],
                        )
                      : Container()
              ],
            ),
            const Divider(height: 30),
            Column(
              children: [
                const Text('Locations:'),
                for (var location in monster[idMonster].locations)
                  (location.name.isNotEmpty)
                      ? Column(
                          children: [Text(location.name)],
                        )
                      : const Column(
                          children: [Text('No locations')],
                        )
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black26),
              child: const Text('Añadir a favoritos'),
              onPressed: () {
                addFavorite(monster[idMonster].id);
              },
            ),
          ],
        ),
      );
    }
  }
}
