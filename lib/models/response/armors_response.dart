import 'package:meta/meta.dart';
import 'dart:convert';

class ArmorResponse {
  int id;
  Type type;
  Rank rank;
  int rarity;
  Defense defense;
  Resistances resistances;
  Attributes attributes;
  String name;
  List<Slot> slots;
  List<Skill> skills;
  ArmorSet armorSet;
  Assets assets;
  Crafting crafting;

  ArmorResponse({
    required this.id,
    required this.type,
    required this.rank,
    required this.rarity,
    required this.defense,
    required this.resistances,
    required this.attributes,
    required this.name,
    required this.slots,
    required this.skills,
    required this.armorSet,
    required this.assets,
    required this.crafting,
  });

  factory ArmorResponse.fromRawJson(String str) =>
      ArmorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArmorResponse.fromJson(Map<String, dynamic> json) => ArmorResponse(
        id: json["id"],
        type: typeValues.map[json["type"]]!,
        rank: rankValues.map[json["rank"]]!,
        rarity: json["rarity"],
        defense: Defense.fromJson(json["defense"]),
        resistances: Resistances.fromJson(json["resistances"]),
        attributes: Attributes.fromJson(json["attributes"]),
        name: json["name"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        armorSet: ArmorSet.fromJson(json["armorSet"]),
        assets: Assets.fromJson(json["assets"]),
        crafting: Crafting.fromJson(json["crafting"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "rank": rankValues.reverse[rank],
        "rarity": rarity,
        "defense": defense.toJson(),
        "resistances": resistances.toJson(),
        "attributes": attributes.toJson(),
        "name": name,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "armorSet": armorSet.toJson(),
        "assets": assets.toJson(),
        "crafting": crafting.toJson(),
      };
}

class ArmorSet {
  int id;
  Rank rank;
  String name;
  List<int> pieces;
  int bonus;

  ArmorSet({
    required this.id,
    required this.rank,
    required this.name,
    required this.pieces,
    required this.bonus,
  });

  factory ArmorSet.fromRawJson(String str) =>
      ArmorSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArmorSet.fromJson(Map<String, dynamic> json) => ArmorSet(
        id: json["id"],
        rank: rankValues.map[json["rank"]]!,
        name: json["name"],
        pieces: List<int>.from(json["pieces"].map((x) => x)),
        bonus: json["bonus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rankValues.reverse[rank],
        "name": name,
        "pieces": List<dynamic>.from(pieces.map((x) => x)),
        "bonus": bonus,
      };
}

enum Rank { HIGH, LOW, MASTER }

final rankValues =
    EnumValues({"high": Rank.HIGH, "low": Rank.LOW, "master": Rank.MASTER});

class Assets {
  String imageMale;
  String imageFemale;

  Assets({
    required this.imageMale,
    required this.imageFemale,
  });

  factory Assets.fromRawJson(String str) => Assets.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        imageMale: json["imageMale"],
        imageFemale: json["imageFemale"],
      );

  Map<String, dynamic> toJson() => {
        "imageMale": imageMale,
        "imageFemale": imageFemale,
      };
}

class Attributes {
  RequiredGender requiredGender;

  Attributes({
    required this.requiredGender,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        requiredGender: requiredGenderValues.map[json["requiredGender"]]!,
      );

  Map<String, dynamic> toJson() => {
        "requiredGender": requiredGenderValues.reverse[requiredGender],
      };
}

enum RequiredGender { FEMALE, MALE }

final requiredGenderValues =
    EnumValues({"female": RequiredGender.FEMALE, "male": RequiredGender.MALE});

class Crafting {
  List<Material> materials;

  Crafting({
    required this.materials,
  });

  factory Crafting.fromRawJson(String str) =>
      Crafting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crafting.fromJson(Map<String, dynamic> json) => Crafting(
        materials: List<Material>.from(
            json["materials"].map((x) => Material.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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

class Defense {
  int base;
  int max;
  int augmented;

  Defense({
    required this.base,
    required this.max,
    required this.augmented,
  });

  factory Defense.fromRawJson(String str) => Defense.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Defense.fromJson(Map<String, dynamic> json) => Defense(
        base: json["base"],
        max: json["max"],
        augmented: json["augmented"],
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "max": max,
        "augmented": augmented,
      };
}

class Resistances {
  int fire;
  int water;
  int ice;
  int thunder;
  int dragon;

  Resistances({
    required this.fire,
    required this.water,
    required this.ice,
    required this.thunder,
    required this.dragon,
  });

  factory Resistances.fromRawJson(String str) =>
      Resistances.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resistances.fromJson(Map<String, dynamic> json) => Resistances(
        fire: json["fire"],
        water: json["water"],
        ice: json["ice"],
        thunder: json["thunder"],
        dragon: json["dragon"],
      );

  Map<String, dynamic> toJson() => {
        "fire": fire,
        "water": water,
        "ice": ice,
        "thunder": thunder,
        "dragon": dragon,
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
  int health;
  int attack;
  int affinity;
  int resistFire;
  int resistWater;
  int defense;
  int damageWater;
  int resistIce;
  int damageThunder;
  int resistThunder;
  int sharpnessBonus;
  int damageFire;
  dynamic damageDragon;
  int damageIce;
  int resistDragon;

  Modifiers({
    required this.health,
    required this.attack,
    required this.affinity,
    required this.resistFire,
    required this.resistWater,
    required this.defense,
    required this.damageWater,
    required this.resistIce,
    required this.damageThunder,
    required this.resistThunder,
    required this.sharpnessBonus,
    required this.damageFire,
    required this.damageDragon,
    required this.damageIce,
    required this.resistDragon,
  });

  factory Modifiers.fromRawJson(String str) =>
      Modifiers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Modifiers.fromJson(Map<String, dynamic> json) => Modifiers(
        health: json["health"],
        attack: json["attack"],
        affinity: json["affinity"],
        resistFire: json["resistFire"],
        resistWater: json["resistWater"],
        defense: json["defense"],
        damageWater: json["damageWater"],
        resistIce: json["resistIce"],
        damageThunder: json["damageThunder"],
        resistThunder: json["resistThunder"],
        sharpnessBonus: json["sharpnessBonus"],
        damageFire: json["damageFire"],
        damageDragon: json["damageDragon"],
        damageIce: json["damageIce"],
        resistDragon: json["resistDragon"],
      );

  Map<String, dynamic> toJson() => {
        "health": health,
        "attack": attack,
        "affinity": affinity,
        "resistFire": resistFire,
        "resistWater": resistWater,
        "defense": defense,
        "damageWater": damageWater,
        "resistIce": resistIce,
        "damageThunder": damageThunder,
        "resistThunder": resistThunder,
        "sharpnessBonus": sharpnessBonus,
        "damageFire": damageFire,
        "damageDragon": damageDragon,
        "damageIce": damageIce,
        "resistDragon": resistDragon,
      };
}

class Slot {
  int rank;

  Slot({
    required this.rank,
  });

  factory Slot.fromRawJson(String str) => Slot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
      };
}

enum Type { CHEST, GLOVES, HEAD, LEGS, WAIST }

final typeValues = EnumValues({
  "chest": Type.CHEST,
  "gloves": Type.GLOVES,
  "head": Type.HEAD,
  "legs": Type.LEGS,
  "waist": Type.WAIST
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
