import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyecto_api/models/response/monsters_response.dart';
import 'package:http/http.dart' as http;

class MonstersProvider extends ChangeNotifier {
  final String _url = 'mhw-db.com';
  List<MonstersResponse> dataMonster = [];
  Map<int, MonstersResponse> dataIdMonster = {};

  MonstersProvider() {
    getOnMonstersData();
  }
  getOnMonstersData() async {
    final response = await http.get(Uri.https(_url, '/monsters', {}));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      dataMonster =
          data.map((item) => MonstersResponse.fromJson(item)).toList();
    }

    notifyListeners();
  }

  Future<void> getOnMonstersId(int id) async {
    final response = await http.get(Uri.https(_url, '/monsters/$id', {}));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      dataIdMonster[id] = MonstersResponse.fromJson(data);
    }
    notifyListeners();
  }
}
