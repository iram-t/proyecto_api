import 'package:meta/meta.dart';
import 'dart:convert';

class ArmorsSetsResponse {
  int id;
  RankEnum rank;
  String name;
  List<Piece> pieces;
  Bonus bonus;

  ArmorsSetsResponse({
    required this.id,
    required this.rank,
    required this.name,
    required this.pieces,
    required this.bonus,
  });

  factory ArmorsSetsResponse.fromRawJson(String str) =>
      ArmorsSetsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArmorsSetsResponse.fromJson(Map<String, dynamic> json) =>
      ArmorsSetsResponse(
        id: json["id"],
        rank: rankEnumValues.map[json["rank"]]!,
        name: json["name"],
        pieces: List<Piece>.from(json["pieces"].map((x) => Piece.fromJson(x))),
        bonus: Bonus.fromJson(json["bonus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rankEnumValues.reverse[rank],
        "name": name,
        "pieces": List<dynamic>.from(pieces.map((x) => x.toJson())),
        "bonus": bonus.toJson(),
      };
}

class Bonus {
  int id;
  String name;
  List<RankElement> ranks;

  Bonus({
    required this.id,
    required this.name,
    required this.ranks,
  });

  factory Bonus.fromRawJson(String str) => Bonus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
        id: json["id"],
        name: json["name"],
        ranks: List<RankElement>.from(
            json["ranks"].map((x) => RankElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
      };
}

class RankElement {
  int pieces;
  RankSkill skill;
  String description;

  RankElement({
    required this.pieces,
    required this.skill,
    required this.description,
  });

  factory RankElement.fromRawJson(String str) =>
      RankElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RankElement.fromJson(Map<String, dynamic> json) => RankElement(
        pieces: json["pieces"],
        skill: RankSkill.fromJson(json["skill"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "pieces": pieces,
        "skill": skill.toJson(),
        "description": description,
      };
}

class RankSkill {
  int id;
  int level;
  PurpleModifiers modifiers;
  int skill;
  String skillName;

  RankSkill({
    required this.id,
    required this.level,
    required this.modifiers,
    required this.skill,
    required this.skillName,
  });

  factory RankSkill.fromRawJson(String str) =>
      RankSkill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RankSkill.fromJson(Map<String, dynamic> json) => RankSkill(
        id: json["id"],
        level: json["level"],
        modifiers: PurpleModifiers.fromJson(json["modifiers"]),
        skill: json["skill"],
        skillName: json["skillName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "modifiers": modifiers.toJson(),
        "skill": skill,
        "skillName": skillName,
      };
}

class PurpleModifiers {
  int affinity;

  PurpleModifiers({
    required this.affinity,
  });

  factory PurpleModifiers.fromRawJson(String str) =>
      PurpleModifiers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleModifiers.fromJson(Map<String, dynamic> json) =>
      PurpleModifiers(
        affinity: json["affinity"],
      );

  Map<String, dynamic> toJson() => {
        "affinity": affinity,
      };
}

class Piece {
  int id;
  Type type;
  RankEnum rank;
  int rarity;
  Attributes attributes;
  Defense defense;
  Resistances resistances;
  String name;
  List<Slot> slots;
  List<SkillElement> skills;
  int armorSet;
  Assets assets;
  Crafting crafting;

  Piece({
    required this.id,
    required this.type,
    required this.rank,
    required this.rarity,
    required this.attributes,
    required this.defense,
    required this.resistances,
    required this.name,
    required this.slots,
    required this.skills,
    required this.armorSet,
    required this.assets,
    required this.crafting,
  });

  factory Piece.fromRawJson(String str) => Piece.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Piece.fromJson(Map<String, dynamic> json) => Piece(
        id: json["id"],
        type: typeValues.map[json["type"]]!,
        rank: rankEnumValues.map[json["rank"]]!,
        rarity: json["rarity"],
        attributes: Attributes.fromJson(json["attributes"]),
        defense: Defense.fromJson(json["defense"]),
        resistances: Resistances.fromJson(json["resistances"]),
        name: json["name"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        skills: List<SkillElement>.from(
            json["skills"].map((x) => SkillElement.fromJson(x))),
        armorSet: json["armorSet"],
        assets: Assets.fromJson(json["assets"]),
        crafting: Crafting.fromJson(json["crafting"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "rank": rankEnumValues.reverse[rank],
        "rarity": rarity,
        "attributes": attributes.toJson(),
        "defense": defense.toJson(),
        "resistances": resistances.toJson(),
        "name": name,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "armorSet": armorSet,
        "assets": assets.toJson(),
        "crafting": crafting.toJson(),
      };
}

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

enum RankEnum { HIGH, LOW, MASTER }

final rankEnumValues = EnumValues(
    {"high": RankEnum.HIGH, "low": RankEnum.LOW, "master": RankEnum.MASTER});

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

class SkillElement {
  int id;
  int level;
  FluffyModifiers modifiers;
  int skill;
  String description;
  String skillName;

  SkillElement({
    required this.id,
    required this.level,
    required this.modifiers,
    required this.skill,
    required this.description,
    required this.skillName,
  });

  factory SkillElement.fromRawJson(String str) =>
      SkillElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SkillElement.fromJson(Map<String, dynamic> json) => SkillElement(
        id: json["id"],
        level: json["level"],
        modifiers: FluffyModifiers.fromJson(json["modifiers"]),
        skill: json["skill"],
        description: json["description"],
        skillName: json["skillName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "modifiers": modifiers.toJson(),
        "skill": skill,
        "description": description,
        "skillName": skillName,
      };
}

class FluffyModifiers {
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

  FluffyModifiers({
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

  factory FluffyModifiers.fromRawJson(String str) =>
      FluffyModifiers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyModifiers.fromJson(Map<String, dynamic> json) =>
      FluffyModifiers(
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
