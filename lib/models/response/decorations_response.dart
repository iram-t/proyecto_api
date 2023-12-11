import 'package:meta/meta.dart';
import 'dart:convert';

class DecorationsResponse {
  int id;
  int rarity;
  int slot;
  String name;
  List<Skill> skills;

  DecorationsResponse({
    required this.id,
    required this.rarity,
    required this.slot,
    required this.name,
    required this.skills,
  });

  factory DecorationsResponse.fromRawJson(String str) =>
      DecorationsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DecorationsResponse.fromJson(Map<String, dynamic> json) =>
      DecorationsResponse(
        id: json["id"],
        rarity: json["rarity"],
        slot: json["slot"],
        name: json["name"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "slot": slot,
        "name": name,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
      };
}

class Skill {
  int id;
  int level;
  Map<String, int> modifiers;
  String description;
  int skill;
  String skillName;

  Skill({
    required this.id,
    required this.level,
    required this.modifiers,
    required this.description,
    required this.skill,
    required this.skillName,
  });

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        level: json["level"],
        modifiers: Map.from(json["modifiers"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        description: json["description"],
        skill: json["skill"],
        skillName: json["skillName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "modifiers":
            Map.from(modifiers).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "description": description,
        "skill": skill,
        "skillName": skillName,
      };
}
