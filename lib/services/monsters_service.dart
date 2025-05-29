import 'package:http/http.dart' as http;

class MonstersService {
  final String _url = 'mhw-db.com';

  Future<http.Response> getMonsters() async {
    final response = await http.get(Uri.https(_url, '/monsters', {}));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load monsters');
    }
  }

  Future<http.Response> getMonsterById(int id) async {
    final response = await http.get(Uri.https(_url, '/monsters/$id', {}));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load monster with id $id');
    }
  }
}
