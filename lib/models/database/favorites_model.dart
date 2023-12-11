import 'package:firebase_auth/firebase_auth.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:proyecto_api/utils/utils.dart';

class FavoritesService {
  final String? uid;
  final int? monsterid;
  final bool? fav;

  FavoritesService({
    this.uid,
    this.monsterid,
    this.fav,
  });
}

addFavorite(int monsterId) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  final objeto = ParseObject('favoritos')
    ..set('uid', currentUser?.uid)
    ..set('monsterid', monsterId)
    ..set('fav', true);
  try {
    await objeto.save();
    Utils.showSusSnackBar('Added to favorites');
  } catch (e) {
    Utils.showSnackBar(e.toString());
  }
}

Future<List<FavoritesService>?> readFavorite() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  try {
    final query = QueryBuilder<ParseObject>(ParseObject('favoritos'))
      ..whereEqualTo('uid', currentUser?.uid);
    final response = await query.query();
    if (response.success &&
        response.results != null &&
        response.results!.isNotEmpty) {
      return response.results?.map((a) {
        return FavoritesService(
          uid: a.get('uid') ?? '',
          monsterid: a.get('monsterid') ?? '',
          fav: a.get('fav') ?? '',
        );
      }).toList();
    } else {
      Utils.showSnackBar(response.error?.message);
    }
  } catch (e) {
    Utils.showSnackBar(e.toString());
  }
  return null;
}

deleteFavorite(int monsterid) async {
  try {
    final query = QueryBuilder<ParseObject>(ParseObject('favoritos'))
      ..whereEqualTo('monsterid', monsterid);
    final response = await query.query();
    if (response.success && response.results != null) {
      final objectDelete = response.results!.first;
      final deleteResponse = await objectDelete.delete();
      if (deleteResponse.success) {
        Utils.showSusSnackBar('Deleted as successful');
      }
    }
  } catch (e) {
    Utils.showSusSnackBar(e.toString());
  }
}
