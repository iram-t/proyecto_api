import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.games_outlined),
            title: const Text('Juegos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.forum_outlined),
            title: const Text('Formulario'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.restore_from_trash_outlined),
            title: const Text('Basura'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
