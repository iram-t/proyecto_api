import 'package:meta/meta.dart';
import 'dart:convert';

class WeaponsResponse {
  int id;
  WeaponsResponseType type;
  int rarity;
  Attack attack;
  Deviation elderseal;
  Attributes attributes;
  Type damageType;
  String name;
  List<Durability> durability;
  List<Slot> slots;
  List<Element> elements;
  Crafting crafting;
  Assets assets;
  Shelling shelling;
  Phial phial;
  BoostType boostType;
  SpecialAmmo specialAmmo;
  Deviation deviation;
  List<Ammo> ammo;
  List<Coating> coatings;

  WeaponsResponse({
    required this.id,
    required this.type,
    required this.rarity,
    required this.attack,
    required this.elderseal,
    required this.attributes,
    required this.damageType,
    required this.name,
    required this.durability,
    required this.slots,
    required this.elements,
    required this.crafting,
    required this.assets,
    required this.shelling,
    required this.phial,
    required this.boostType,
    required this.specialAmmo,
    required this.deviation,
    required this.ammo,
    required this.coatings,
  });

  factory WeaponsResponse.fromRawJson(String str) =>
      WeaponsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeaponsResponse.fromJson(Map<String, dynamic> json) =>
      WeaponsResponse(
        id: json["id"],
        type: weaponsResponseTypeValues.map[json["type"]]!,
        rarity: json["rarity"],
        attack: Attack.fromJson(json["attack"]),
        elderseal: deviationValues.map[json["elderseal"]]!,
        attributes: Attributes.fromJson(json["attributes"]),
        damageType: typeValues.map[json["damageType"]]!,
        name: json["name"],
        durability: List<Durability>.from(
            json["durability"].map((x) => Durability.fromJson(x))),
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        elements: List<Element>.from(
            json["elements"].map((x) => Element.fromJson(x))),
        crafting: Crafting.fromJson(json["crafting"]),
        assets: Assets.fromJson(json["assets"]),
        shelling: Shelling.fromJson(json["shelling"]),
        phial: Phial.fromJson(json["phial"]),
        boostType: boostTypeValues.map[json["boostType"]]!,
        specialAmmo: specialAmmoValues.map[json["specialAmmo"]]!,
        deviation: deviationValues.map[json["deviation"]]!,
        ammo: List<Ammo>.from(json["ammo"].map((x) => Ammo.fromJson(x))),
        coatings: List<Coating>.from(
            json["coatings"].map((x) => coatingValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": weaponsResponseTypeValues.reverse[type],
        "rarity": rarity,
        "attack": attack.toJson(),
        "elderseal": deviationValues.reverse[elderseal],
        "attributes": attributes.toJson(),
        "damageType": typeValues.reverse[damageType],
        "name": name,
        "durability": List<dynamic>.from(durability.map((x) => x.toJson())),
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
        "crafting": crafting.toJson(),
        "assets": assets.toJson(),
        "shelling": shelling.toJson(),
        "phial": phial.toJson(),
        "boostType": boostTypeValues.reverse[boostType],
        "specialAmmo": specialAmmoValues.reverse[specialAmmo],
        "deviation": deviationValues.reverse[deviation],
        "ammo": List<dynamic>.from(ammo.map((x) => x.toJson())),
        "coatings":
            List<dynamic>.from(coatings.map((x) => coatingValues.reverse[x])),
      };
}

class Ammo {
  AmmoType type;
  List<int> capacities;

  Ammo({
    required this.type,
    required this.capacities,
  });

  factory Ammo.fromRawJson(String str) => Ammo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ammo.fromJson(Map<String, dynamic> json) => Ammo(
        type: ammoTypeValues.map[json["type"]]!,
        capacities: List<int>.from(json["capacities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": ammoTypeValues.reverse[type],
        "capacities": List<dynamic>.from(capacities.map((x) => x)),
      };
}

enum AmmoType {
  ARMOR,
  CLUSTER,
  DEMON,
  DRAGON,
  EXHAUST,
  FLAMING,
  FREEZE,
  NORMAL,
  PARALYSIS,
  PIERCING,
  POISON,
  RECOVER,
  SLEEP,
  SLICING,
  SPREAD,
  STICKY,
  THUNDER,
  TRANQ,
  WATER,
  WYVERN
}

final ammoTypeValues = EnumValues({
  "armor": AmmoType.ARMOR,
  "cluster": AmmoType.CLUSTER,
  "demon": AmmoType.DEMON,
  "dragon": AmmoType.DRAGON,
  "exhaust": AmmoType.EXHAUST,
  "flaming": AmmoType.FLAMING,
  "freeze": AmmoType.FREEZE,
  "normal": AmmoType.NORMAL,
  "paralysis": AmmoType.PARALYSIS,
  "piercing": AmmoType.PIERCING,
  "poison": AmmoType.POISON,
  "recover": AmmoType.RECOVER,
  "sleep": AmmoType.SLEEP,
  "slicing": AmmoType.SLICING,
  "spread": AmmoType.SPREAD,
  "sticky": AmmoType.STICKY,
  "thunder": AmmoType.THUNDER,
  "tranq": AmmoType.TRANQ,
  "water": AmmoType.WATER,
  "wyvern": AmmoType.WYVERN
});

class Assets {
  String icon;
  String image;

  Assets({
    required this.icon,
    required this.image,
  });

  factory Assets.fromRawJson(String str) => Assets.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        icon: json["icon"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "image": image,
      };
}

class Attack {
  int display;
  int raw;

  Attack({
    required this.display,
    required this.raw,
  });

  factory Attack.fromRawJson(String str) => Attack.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
        display: json["display"],
        raw: json["raw"],
      );

  Map<String, dynamic> toJson() => {
        "display": display,
        "raw": raw,
      };
}

class Attributes {
  dynamic affinity;
  int defense;
  Type boostType;
  Type damageType;
  List<Coating> coatings;
  Deviation elderseal;

  Attributes({
    required this.affinity,
    required this.defense,
    required this.boostType,
    required this.damageType,
    required this.coatings,
    required this.elderseal,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        affinity: json["affinity"],
        defense: json["defense"],
        boostType: typeValues.map[json["boostType"]]!,
        damageType: typeValues.map[json["damageType"]]!,
        coatings: List<Coating>.from(
            json["coatings"].map((x) => coatingValues.map[x]!)),
        elderseal: deviationValues.map[json["elderseal"]]!,
      );

  Map<String, dynamic> toJson() => {
        "affinity": affinity,
        "defense": defense,
        "boostType": typeValues.reverse[boostType],
        "damageType": typeValues.reverse[damageType],
        "coatings":
            List<dynamic>.from(coatings.map((x) => coatingValues.reverse[x])),
        "elderseal": deviationValues.reverse[elderseal],
      };
}

enum Type { BLUNT, PROJECTILE, SEVER }

final typeValues = EnumValues(
    {"blunt": Type.BLUNT, "projectile": Type.PROJECTILE, "sever": Type.SEVER});

enum Coating { BLAST, CLOSE_RANGE, PARALYSIS, POISON, POWER, SLEEP }

final coatingValues = EnumValues({
  "blast": Coating.BLAST,
  "close range": Coating.CLOSE_RANGE,
  "paralysis": Coating.PARALYSIS,
  "poison": Coating.POISON,
  "power": Coating.POWER,
  "sleep": Coating.SLEEP
});

enum Deviation { AVERAGE, HIGH, LOW, NONE }

final deviationValues = EnumValues({
  "average": Deviation.AVERAGE,
  "high": Deviation.HIGH,
  "low": Deviation.LOW,
  "none": Deviation.NONE
});

enum BoostType { BLUNT, ELEMENT, HEALTH, SEVER, SPEED, STAMINA }

final boostTypeValues = EnumValues({
  "blunt": BoostType.BLUNT,
  "element": BoostType.ELEMENT,
  "health": BoostType.HEALTH,
  "sever": BoostType.SEVER,
  "speed": BoostType.SPEED,
  "stamina": BoostType.STAMINA
});

class Crafting {
  bool craftable;
  int previous;
  List<int> branches;
  List<Material> craftingMaterials;
  List<Material> upgradeMaterials;

  Crafting({
    required this.craftable,
    required this.previous,
    required this.branches,
    required this.craftingMaterials,
    required this.upgradeMaterials,
  });

  factory Crafting.fromRawJson(String str) =>
      Crafting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crafting.fromJson(Map<String, dynamic> json) => Crafting(
        craftable: json["craftable"],
        previous: json["previous"],
        branches: List<int>.from(json["branches"].map((x) => x)),
        craftingMaterials: List<Material>.from(
            json["craftingMaterials"].map((x) => Material.fromJson(x))),
        upgradeMaterials: List<Material>.from(
            json["upgradeMaterials"].map((x) => Material.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "craftable": craftable,
        "previous": previous,
        "branches": List<dynamic>.from(branches.map((x) => x)),
        "craftingMaterials":
            List<dynamic>.from(craftingMaterials.map((x) => x.toJson())),
        "upgradeMaterials":
            List<dynamic>.from(upgradeMaterials.map((x) => x.toJson())),
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

class Durability {
  int red;
  int orange;
  int yellow;
  int green;
  int blue;
  int white;
  int purple;

  Durability({
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.blue,
    required this.white,
    required this.purple,
  });

  factory Durability.fromRawJson(String str) =>
      Durability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Durability.fromJson(Map<String, dynamic> json) => Durability(
        red: json["red"],
        orange: json["orange"],
        yellow: json["yellow"],
        green: json["green"],
        blue: json["blue"],
        white: json["white"],
        purple: json["purple"],
      );

  Map<String, dynamic> toJson() => {
        "red": red,
        "orange": orange,
        "yellow": yellow,
        "green": green,
        "blue": blue,
        "white": white,
        "purple": purple,
      };
}

class Element {
  ElementType type;
  int damage;
  bool hidden;

  Element({
    required this.type,
    required this.damage,
    required this.hidden,
  });

  factory Element.fromRawJson(String str) => Element.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        type: elementTypeValues.map[json["type"]]!,
        damage: json["damage"],
        hidden: json["hidden"],
      );

  Map<String, dynamic> toJson() => {
        "type": elementTypeValues.reverse[type],
        "damage": damage,
        "hidden": hidden,
      };
}

enum ElementType {
  BLAST,
  DRAGON,
  FIRE,
  ICE,
  PARALYSIS,
  POISON,
  SLEEP,
  THUNDER,
  WATER
}

final elementTypeValues = EnumValues({
  "blast": ElementType.BLAST,
  "dragon": ElementType.DRAGON,
  "fire": ElementType.FIRE,
  "ice": ElementType.ICE,
  "paralysis": ElementType.PARALYSIS,
  "poison": ElementType.POISON,
  "sleep": ElementType.SLEEP,
  "thunder": ElementType.THUNDER,
  "water": ElementType.WATER
});

class Phial {
  PhialType type;
  int damage;

  Phial({
    required this.type,
    required this.damage,
  });

  factory Phial.fromRawJson(String str) => Phial.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Phial.fromJson(Map<String, dynamic> json) => Phial(
        type: phialTypeValues.map[json["type"]]!,
        damage: json["damage"],
      );

  Map<String, dynamic> toJson() => {
        "type": phialTypeValues.reverse[type],
        "damage": damage,
      };
}

enum PhialType { DRAGON, EXHAUST, IMPACT, PARA, POISON, POWER, POWER_ELEMENT }

final phialTypeValues = EnumValues({
  "dragon": PhialType.DRAGON,
  "exhaust": PhialType.EXHAUST,
  "impact": PhialType.IMPACT,
  "para": PhialType.PARA,
  "poison": PhialType.POISON,
  "power": PhialType.POWER,
  "power element": PhialType.POWER_ELEMENT
});

class Shelling {
  ShellingType type;
  int level;

  Shelling({
    required this.type,
    required this.level,
  });

  factory Shelling.fromRawJson(String str) =>
      Shelling.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shelling.fromJson(Map<String, dynamic> json) => Shelling(
        type: shellingTypeValues.map[json["type"]]!,
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "type": shellingTypeValues.reverse[type],
        "level": level,
      };
}

enum ShellingType { LONG, NORMAL, WIDE }

final shellingTypeValues = EnumValues({
  "long": ShellingType.LONG,
  "normal": ShellingType.NORMAL,
  "wide": ShellingType.WIDE
});

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

enum SpecialAmmo { WYVERNBLAST, WYVERNHEART, WYVERNSNIPE }

final specialAmmoValues = EnumValues({
  "wyvernblast": SpecialAmmo.WYVERNBLAST,
  "wyvernheart": SpecialAmmo.WYVERNHEART,
  "wyvernsnipe": SpecialAmmo.WYVERNSNIPE
});

enum WeaponsResponseType {
  BOW,
  CHARGE_BLADE,
  DUAL_BLADES,
  GREAT_SWORD,
  GUNLANCE,
  HAMMER,
  HEAVY_BOWGUN,
  HUNTING_HORN,
  INSECT_GLAIVE,
  LANCE,
  LIGHT_BOWGUN,
  LONG_SWORD,
  SWITCH_AXE,
  SWORD_AND_SHIELD
}

final weaponsResponseTypeValues = EnumValues({
  "bow": WeaponsResponseType.BOW,
  "charge-blade": WeaponsResponseType.CHARGE_BLADE,
  "dual-blades": WeaponsResponseType.DUAL_BLADES,
  "great-sword": WeaponsResponseType.GREAT_SWORD,
  "gunlance": WeaponsResponseType.GUNLANCE,
  "hammer": WeaponsResponseType.HAMMER,
  "heavy-bowgun": WeaponsResponseType.HEAVY_BOWGUN,
  "hunting-horn": WeaponsResponseType.HUNTING_HORN,
  "insect-glaive": WeaponsResponseType.INSECT_GLAIVE,
  "lance": WeaponsResponseType.LANCE,
  "light-bowgun": WeaponsResponseType.LIGHT_BOWGUN,
  "long-sword": WeaponsResponseType.LONG_SWORD,
  "switch-axe": WeaponsResponseType.SWITCH_AXE,
  "sword-and-shield": WeaponsResponseType.SWORD_AND_SHIELD
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
