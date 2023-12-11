import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/models/database/favorites_model.dart';
import 'package:proyecto_api/providers/monsters_provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<FavoritesService>? userdata;
  bool dataLoaded = false;
  @override
  void initState() {
    super.initState();
    getId();
  }

  Future<void> getId() async {
    final a = await readFavorite();
    setState(() {
      userdata = a;
    });
    await Future.wait(userdata!.map((fav) async {
      await context
          .read<MonstersProvider>()
          .getOnMonstersId(fav.monsterid!.toInt());
    }));

    // Datos cargados, actualizamos el estado del widget
    setState(() {
      dataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postMnt = context.read<MonstersProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: userdata?.length ?? 0,
        itemBuilder: (context, index) {
          if (userdata != null && userdata!.isNotEmpty) {
            final monsterId = userdata![index].monsterid;
            final monster = postMnt.dataIdMonster[monsterId];

            Map<String, dynamic> arguments = {
              'monster': monster,
              'idmonster': monsterId,
              'fav': userdata![index].fav,
            };
            return Column(
              children: [
                ListTile(
                  title: Text(monster?.name ?? 'Loading...'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'details',
                      arguments: arguments,
                    );
                  },
                ),
                const Divider(height: 5, thickness: 1)
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
