import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_api/models/monsters_response.dart';
import 'package:http/http.dart' as http;

final monstersProvider =
    AsyncNotifierProvider<MonstersNotifier, List<MonstersResponse>>(
  MonstersNotifier.new,
);

class MonstersNotifier extends AsyncNotifier<List<MonstersResponse>> {
  final String _url = 'mhw-db.com';

  Map<int, MonstersResponse> dataIdMonster = {};

  @override
  Future<List<MonstersResponse>> build() async {
    // Esta función se ejecuta al usar ref.watch(monstersProvider)
    return await _fetchMonsters();
  }

  Future<List<MonstersResponse>> _fetchMonsters() async {
    final response = await http.get(Uri.https(_url, '/monsters', {}));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => MonstersResponse.fromJson(item)).toList();
    }
    return [];
  }

  Future<MonstersResponse> fetchMonsterById(int id) async {
    final response = await http.get(Uri.https(_url, '/monsters/$id', {}));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MonstersResponse.fromJson(data);
    }
    throw Exception('Failed to load monster with id $id');
  }
}
