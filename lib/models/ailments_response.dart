import 'package:meta/meta.dart';
import 'dart:convert';

class AilmentsResponse {
  int id;
  String name;
  String description;
  Recovery recovery;
  Protection protection;

  AilmentsResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.recovery,
    required this.protection,
  });

  factory AilmentsResponse.fromRawJson(String str) =>
      AilmentsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AilmentsResponse.fromJson(Map<String, dynamic> json) =>
      AilmentsResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        recovery: Recovery.fromJson(json["recovery"]),
        protection: Protection.fromJson(json["protection"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "recovery": recovery.toJson(),
        "protection": protection.toJson(),
      };
}

class Protection {
  List<Item> items;
  List<Skill> skills;

  Protection({
    required this.items,
    required this.skills,
  });

  factory Protection.fromRawJson(String str) =>
      Protection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
      };
}

class Item {
  int id;
  int rarity;
  int value;
  int carryLimit;
  String name;
  String description;

  Item({
    required this.id,
    required this.rarity,
    required this.value,
    required this.carryLimit,
    required this.name,
    required this.description,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rarity: json["rarity"],
        value: json["value"],
        carryLimit: json["carryLimit"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "value": value,
        "carryLimit": carryLimit,
        "name": name,
        "description": description,
      };
}

class Skill {
  int id;
  String name;
  String description;

  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Recovery {
  List<String> actions;
  List<Item> items;

  Recovery({
    required this.actions,
    required this.items,
  });

  factory Recovery.fromRawJson(String str) =>
      Recovery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recovery.fromJson(Map<String, dynamic> json) => Recovery(
        actions: List<String>.from(json["actions"].map((x) => x)),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "actions": List<dynamic>.from(actions.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
