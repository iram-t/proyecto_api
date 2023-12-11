import 'package:flutter/material.dart';
import 'package:proyecto_api/models/response/monsters_response.dart';

class ListViewMain extends StatelessWidget {
  final List<MonstersResponse> monster;
  final String? type;
  final String? specie;
  const ListViewMain(
      {super.key, required this.monster, this.type, this.specie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: monster.length,
        itemBuilder: (context, index) {
          final item = monster[index];
          Map<String, dynamic> arguments = {
            'monster': monster,
            'idmonster': item.id
          };
          if (type == 'large' &&
              item.type == monstersResponseTypeValues.map['large'] &&
              item.species != 'elder dragon') {
            return Column(
              children: [
                ListTile(
                  title: Text(item.name),
                  onTap: () => Navigator.pushNamed(
                    context,
                    'details',
                    arguments: arguments,
                  ),
                ),
                const Divider(height: 5, thickness: 1)
              ],
            );
          } else if (type == 'small' &&
              item.type == monstersResponseTypeValues.map['small']) {
            return Column(
              children: [
                ListTile(
                  title: Text(item.name),
                  onTap: () => Navigator.pushNamed(
                    context,
                    'details',
                    arguments: arguments,
                  ),
                ),
                const Divider(height: 5, thickness: 1)
              ],
            );
          } else if (item.species == specie) {
            return Column(
              children: [
                ListTile(
                  title: Text(item.name),
                  onTap: () => Navigator.pushNamed(
                    context,
                    'details',
                    arguments: arguments,
                  ),
                ),
                const Divider(height: 5, thickness: 1)
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
