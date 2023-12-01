import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/providers/monsters_provider.dart';
import 'package:proyecto_api/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final postMnt = Provider.of<MonstersProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Monsters'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Elder Dragon'),
              Tab(text: 'Large'),
              Tab(text: 'Small'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: ListViewMain(
              monster: postMnt.dataMonster,
              specie: 'elder dragon',
            )),
            Center(
                child: ListViewMain(
              monster: postMnt.dataMonster,
              type: 'large',
            )),
            Center(
                child: ListViewMain(
              monster: postMnt.dataMonster,
              type: 'small',
            )),
          ],
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
