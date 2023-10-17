import 'package:flutter/material.dart';
import 'package:proyecto_api/models/monsters_response.dart';
import 'package:proyecto_api/providers/monsters_services.dart';

class MonstersProvider extends ChangeNotifier {
  late MonstersResponse data;
  bool loading = false;
  Services services = Services();
  getOnMonstersData(context) async {
    loading = true;
    data = await services.getData(context);
    loading = false;
    notifyListeners();
  }
}
