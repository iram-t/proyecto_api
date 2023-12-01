import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyecto_api/models/monsters_response.dart';
import 'package:http/http.dart' as http;

class MonstersProvider extends ChangeNotifier {
  final String _url = 'mhw-db.com';
  List<MonstersResponse> dataMonster = [];

  MonstersProvider() {
    getOnMonstersData();
  }
  getOnMonstersData() async {
    final response = await http.get(Uri.https(_url, '/monsters', {}));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // for (var element in data) {
      //   dataMonster = data[element];
      // }
      dataMonster =
          data.map((item) => MonstersResponse.fromJson(item)).toList();
    }

    notifyListeners();
  }
}
