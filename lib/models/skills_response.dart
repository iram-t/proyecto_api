import 'package:meta/meta.dart';
import 'dart:convert';

class SkillsResponse {
  int id;
  String name;
  String description;
  List<Rank> ranks;

  SkillsResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.ranks,
  });

  factory SkillsResponse.fromRawJson(String str) =>
      SkillsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SkillsResponse.fromJson(Map<String, dynamic> json) => SkillsResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
      };
}

class Rank {
  int id;
  int skill;
  int level;
  Modifiers modifiers;
  String description;
  String skillName;

  Rank({
    required this.id,
    required this.skill,
    required this.level,
    required this.modifiers,
    required this.description,
    required this.skillName,
  });

  factory Rank.fromRawJson(String str) => Rank.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        id: json["id"],
        skill: json["skill"],
        level: json["level"],
        modifiers: Modifiers.fromJson(json["modifiers"]),
        description: json["description"],
        skillName: json["skillName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "skill": skill,
        "level": level,
        "modifiers": modifiers.toJson(),
        "description": description,
        "skillName": skillName,
      };
}

class Modifiers {
  int attack;
  int affinity;
  int defense;
  int resistAll;
  int health;
  int resistFire;
  int resistWater;
  int resistIce;
  int resistThunder;
  int resistDragon;
  dynamic damageFire;
  dynamic damageWater;
  dynamic damageIce;
  dynamic damageThunder;
  dynamic damageDragon;
  int sharpnessBonus;

  Modifiers({
    required this.attack,
    required this.affinity,
    required this.defense,
    required this.resistAll,
    required this.health,
    required this.resistFire,
    required this.resistWater,
    required this.resistIce,
    required this.resistThunder,
    required this.resistDragon,
    required this.damageFire,
    required this.damageWater,
    required this.damageIce,
    required this.damageThunder,
    required this.damageDragon,
    required this.sharpnessBonus,
  });

  factory Modifiers.fromRawJson(String str) =>
      Modifiers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Modifiers.fromJson(Map<String, dynamic> json) => Modifiers(
        attack: json["attack"],
        affinity: json["affinity"],
        defense: json["defense"],
        resistAll: json["resistAll"],
        health: json["health"],
        resistFire: json["resistFire"],
        resistWater: json["resistWater"],
        resistIce: json["resistIce"],
        resistThunder: json["resistThunder"],
        resistDragon: json["resistDragon"],
        damageFire: json["damageFire"],
        damageWater: json["damageWater"],
        damageIce: json["damageIce"],
        damageThunder: json["damageThunder"],
        damageDragon: json["damageDragon"],
        sharpnessBonus: json["sharpnessBonus"],
      );

  Map<String, dynamic> toJson() => {
        "attack": attack,
        "affinity": affinity,
        "defense": defense,
        "resistAll": resistAll,
        "health": health,
        "resistFire": resistFire,
        "resistWater": resistWater,
        "resistIce": resistIce,
        "resistThunder": resistThunder,
        "resistDragon": resistDragon,
        "damageFire": damageFire,
        "damageWater": damageWater,
        "damageIce": damageIce,
        "damageThunder": damageThunder,
        "damageDragon": damageDragon,
        "sharpnessBonus": sharpnessBonus,
      };
}
