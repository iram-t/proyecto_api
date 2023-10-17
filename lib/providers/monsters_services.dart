import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_api/models/monsters_response.dart';

class Services {
  Future<MonstersResponse> getData(context) async {
    late MonstersResponse data;
    try {
      final response =
          await http.get(Uri.parse('https://mhw-db.com/monsters/1'));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        data = MonstersResponse.fromJson(item);
        print(data);
      } else {
        print('error ahh');
      }
    } catch (e) {
      print(e);
    }
    return data;
  }
}
