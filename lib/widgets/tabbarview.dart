import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_api/models/models.dart';
import 'package:proyecto_api/providers/monsters_provider.dart';
import 'package:proyecto_api/widgets/widgets.dart';
import 'package:proyecto_api/providers/monsters_services.dart';

class TabBarHome extends StatefulWidget {
  const TabBarHome({super.key});

  @override
  State<TabBarHome> createState() => _TabBarHomeState();
}

class _TabBarHomeState extends State<TabBarHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<MonstersProvider>(context, listen: false)
        .getOnMonstersData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMnt = Provider.of<MonstersProvider>(context);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Monsters'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Elder Dragon'),
                Tab(text: 'Big'),
                Tab(text: 'Small'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: ListViewMain()),
              Center(child: ListViewMain()),
              Center(child: ListViewMain()),
            ],
          ),
          drawer: DrawerHome(),
        ),
      ),
    );
  }
}
