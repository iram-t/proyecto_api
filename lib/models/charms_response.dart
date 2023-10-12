import 'package:meta/meta.dart';
import 'dart:convert';

class CharmsResponse {
  int id;
  String name;
  List<Rank> ranks;

  CharmsResponse({
    required this.id,
    required this.name,
    required this.ranks,
  });

  factory CharmsResponse.fromRawJson(String str) =>
      CharmsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharmsResponse.fromJson(Map<String, dynamic> json) => CharmsResponse(
        id: json["id"],
        name: json["name"],
        ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
      };
}

class Rank {
  int level;
  int rarity;
  String name;
  List<Skill> skills;
  Crafting crafting;

  Rank({
    required this.level,
    required this.rarity,
    required this.name,
    required this.skills,
    required this.crafting,
  });

  factory Rank.fromRawJson(String str) => Rank.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        level: json["level"],
        rarity: json["rarity"],
        name: json["name"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        crafting: Crafting.fromJson(json["crafting"]),
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "rarity": rarity,
        "name": name,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "crafting": crafting.toJson(),
      };
}

class Crafting {
  bool craftable;
  List<Material> materials;

  Crafting({
    required this.craftable,
    required this.materials,
  });

  factory Crafting.fromRawJson(String str) =>
      Crafting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crafting.fromJson(Map<String, dynamic> json) => Crafting(
        craftable: json["craftable"],
        materials: List<Material>.from(
            json["materials"].map((x) => Material.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "craftable": craftable,
        "materials": List<dynamic>.from(materials.map((x) => x.toJson())),
      };
}

class Material {
  int quantity;
  Item item;

  Material({
    required this.quantity,
    required this.item,
  });

  factory Material.fromRawJson(String str) =>
      Material.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        quantity: json["quantity"],
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "item": item.toJson(),
      };
}

class Item {
  int id;
  int rarity;
  int carryLimit;
  int value;
  String name;
  String description;

  Item({
    required this.id,
    required this.rarity,
    required this.carryLimit,
    required this.value,
    required this.name,
    required this.description,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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

class Skill {
  int id;
  int level;
  Modifiers modifiers;
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
        modifiers: Modifiers.fromJson(json["modifiers"]),
        description: json["description"],
        skill: json["skill"],
        skillName: json["skillName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "modifiers": modifiers.toJson(),
        "description": description,
        "skill": skill,
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
  int resistThunder;
  dynamic damageFire;
  dynamic damageWater;
  dynamic damageThunder;
  int resistIce;
  dynamic damageIce;
  int resistDragon;
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
    required this.resistThunder,
    required this.damageFire,
    required this.damageWater,
    required this.damageThunder,
    required this.resistIce,
    required this.damageIce,
    required this.resistDragon,
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
        resistThunder: json["resistThunder"],
        damageFire: json["damageFire"],
        damageWater: json["damageWater"],
        damageThunder: json["damageThunder"],
        resistIce: json["resistIce"],
        damageIce: json["damageIce"],
        resistDragon: json["resistDragon"],
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
        "resistThunder": resistThunder,
        "damageFire": damageFire,
        "damageWater": damageWater,
        "damageThunder": damageThunder,
        "resistIce": resistIce,
        "damageIce": damageIce,
        "resistDragon": resistDragon,
        "damageDragon": damageDragon,
        "sharpnessBonus": sharpnessBonus,
      };
}
