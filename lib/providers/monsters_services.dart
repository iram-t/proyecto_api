import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_api/models/monsters_response.dart';

class Services {
  Future<List<MonstersResponse>> getData(context) async {
    List<MonstersResponse> data = [];
    try {
      final response = await http.get(Uri.parse('https://mhw-db.com/monsters'));
      if (response.statusCode == 200) {
        final List<dynamic> item = json.decode(response.body);
        for (var x in item) {
          data.add(MonstersResponse.fromJson(x as Map<String, dynamic>));
        }
      } else {
        print('error ahh');
      }
    } catch (e) {
      print(e);
    }
    return data;
  }
}
