import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_api/providers/monster_provider.dart';
import 'package:proyecto_api/widgets/widgets.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataMonster = ref.watch(monstersProvider);
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
        body: dataMonster.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (monsters) => TabBarView(
            children: [
              Center(
                child: ListViewMain(
                  monster: monsters,
                  specie: 'elder dragon',
                ),
              ),
              Center(
                child: ListViewMain(
                  monster: monsters,
                  type: 'large',
                ),
              ),
              Center(
                child: ListViewMain(
                  monster: monsters,
                  type: 'small',
                ),
              ),
            ],
          ),
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
