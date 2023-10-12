import 'package:meta/meta.dart';
import 'dart:convert';

class ItemsResponse {
  int id;
  int rarity;
  int carryLimit;
  int value;
  String name;
  String description;

  ItemsResponse({
    required this.id,
    required this.rarity,
    required this.carryLimit,
    required this.value,
    required this.name,
    required this.description,
  });

  factory ItemsResponse.fromRawJson(String str) =>
      ItemsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemsResponse.fromJson(Map<String, dynamic> json) => ItemsResponse(
        id: json["id"],
        rarity: json["rarity"],
        carryLimit: json["carryLimit"],
        value: json["value"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "carryLimit": carryLimit,
        "value": value,
        "name": name,
        "description": description,
      };
}
