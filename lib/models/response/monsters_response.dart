import 'dart:convert';

List<MonstersResponse> monstersResponseFromJson(String str) =>
    List<MonstersResponse>.from(
        json.decode(str).map((x) => MonstersResponse.fromJson(x)));

/*
String monstersResponseToJson(List<MonstersResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

class MonstersResponse {
  int id;
  MonstersResponseType type;
  String species;
  List<Element> elements;
  String name;
  String description;
  List<Ailment> ailments;
  List<Location> locations;
  List<Resistance> resistances;
  List<Weakness> weaknesses;
  List<Reward> rewards;

  MonstersResponse({
    required this.id,
    required this.type,
    required this.species,
    required this.elements,
    required this.name,
    required this.description,
    required this.ailments,
    required this.locations,
    required this.resistances,
    required this.weaknesses,
    required this.rewards,
  });

  factory MonstersResponse.fromRawJson(String str) =>
      MonstersResponse.fromJson(json.decode(str));

  factory MonstersResponse.fromJson(Map<String, dynamic> json) =>
      MonstersResponse(
        id: json["id"],
        type: monstersResponseTypeValues.map[json["type"]]!,
        species: json["species"],
        elements: List<Element>.from(
            json["elements"].map((x) => elementValues.map[x]!)),
        name: json["name"],
        description: json["description"],
        ailments: List<Ailment>.from(
            json["ailments"].map((x) => Ailment.fromJson(x))),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        resistances: List<Resistance>.from(
            json["resistances"].map((x) => Resistance.fromJson(x))),
        weaknesses: List<Weakness>.from(
            json["weaknesses"].map((x) => Weakness.fromJson(x))),
        rewards:
            List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x))),
      );

  /*Map<String, dynamic> toJson() => {
        "id": id,
        "type": monstersResponseTypeValues.reverse[type],
        "species": species,
        "elements":
            List<dynamic>.from(elements.map((x) => elementValues.reverse[x])),
        "name": name,
        "description": description,
        "ailments": List<dynamic>.from(ailments.map((x) => x.toJson())),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "resistances": List<dynamic>.from(resistances.map((x) => x.toJson())),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x.toJson())),
        "rewards": List<dynamic>.from(rewards.map((x) => x.toJson())),
      };*/
}

class Ailment {
  int id;
  String name;
  String description;
  Recovery recovery;
  Protection protection;

  Ailment({
    required this.id,
    required this.name,
    required this.description,
    required this.recovery,
    required this.protection,
  });

  factory Ailment.fromJson(Map<String, dynamic> json) => Ailment(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        recovery: Recovery.fromJson(json["recovery"]),
        protection: Protection.fromJson(json["protection"]),
      );

  /*Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "recovery": recovery.toJson(),
        "protection": protection.toJson(),
      };*/
  @override
  String toString() {
    // Devuelve una cadena que representa la información de la instancia
    return '{Id: $id, Name: $name, Description: $description, Recovery: $recovery, Protection: $protection}';
  }
}

class Protection {
  List<Skill> skills;
  List<Item> items;

  Protection({
    required this.skills,
    required this.items,
  });

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  /*Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };*/
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rarity: json["rarity"],
        value: json["value"],
        carryLimit: json["carryLimit"],
        name: json["name"],
        description: json["description"],
      );

  /* Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "value": value,
        "carryLimit": carryLimit,
        "name": name,
        "description": description,
      };*/
  @override
  String toString() {
    // Devuelve una cadena que representa la información de la instancia
    return '{Id: $id, Rarity: $rarity, Value: $value, Carry Limit: $carryLimit, Name: $name, Description: $description}';
  }
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

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  /* Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };*/
  @override
  String toString() {
    // Devuelve una cadena que representa la información de la instancia
    return '{Id: $id, name: $name, description: $description}';
  }
}

class Recovery {
  List<Action> actions;
  List<Item> items;

  Recovery({
    required this.actions,
    required this.items,
  });

  factory Recovery.fromJson(Map<String, dynamic> json) => Recovery(
        actions:
            List<Action>.from(json["actions"].map((x) => actionValues.map[x]!)),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  /* Map<String, dynamic> toJson() => {
        "actions":
            List<dynamic>.from(actions.map((x) => actionValues.reverse[x])),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };*/
}

enum Action { DODGE }

final actionValues = EnumValues({"dodge": Action.DODGE});

enum Element {
  BLAST,
  DRAGON,
  FIRE,
  ICE,
  PARALYSIS,
  POISON,
  SLEEP,
  STUN,
  THUNDER,
  WATER
}

final elementValues = EnumValues({
  "blast": Element.BLAST,
  "dragon": Element.DRAGON,
  "fire": Element.FIRE,
  "ice": Element.ICE,
  "paralysis": Element.PARALYSIS,
  "poison": Element.POISON,
  "sleep": Element.SLEEP,
  "stun": Element.STUN,
  "thunder": Element.THUNDER,
  "water": Element.WATER
});

class Location {
  int id;
  int zoneCount;
  String name;

  Location({
    required this.id,
    required this.zoneCount,
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        zoneCount: json["zoneCount"],
        name: json["name"],
      );
/*
  Map<String, dynamic> toJson() => {
        "id": id,
        "zoneCount": zoneCount,
        "name": name,
      };*/
  @override
  String toString() {
    // Devuelve una cadena que representa la información de la instancia
    return '{Id: $id, zoneCount: $zoneCount, name: $name}';
  }
}

class Resistance {
  Element element;
  String? condition;

  Resistance({
    required this.element,
    required this.condition,
  });

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
        element: elementValues.map[json["element"]]!,
        condition: json["condition"],
      );
/*
  Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "condition": condition,
      };*/
}

class Reward {
  int id;
  Item item;
  List<Condition> conditions;

  Reward({
    required this.id,
    required this.item,
    required this.conditions,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["id"],
        item: Item.fromJson(json["item"]),
        conditions: List<Condition>.from(
            json["conditions"].map((x) => Condition.fromJson(x))),
      );
/*
  Map<String, dynamic> toJson() => {
        "id": id,
        "item": item.toJson(),
        "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
      };*/
}

class Condition {
  ConditionType type;
  Rank rank;
  int quantity;
  int chance;
  String? subtype;

  Condition({
    required this.type,
    required this.rank,
    required this.quantity,
    required this.chance,
    required this.subtype,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        type: conditionTypeValues.map[json["type"]]!,
        rank: rankValues.map[json["rank"]]!,
        quantity: json["quantity"],
        chance: json["chance"],
        subtype: json["subtype"],
      );
/*
  Map<String, dynamic> toJson() => {
        "type": conditionTypeValues.reverse[type],
        "rank": rankValues.reverse[rank],
        "quantity": quantity,
        "chance": chance,
        "subtype": subtype,
      };*/
}

enum Rank { HIGH, LOW }

final rankValues = EnumValues({"high": Rank.HIGH, "low": Rank.LOW});

enum ConditionType {
  CARVE,
  INVESTIGATION,
  PALICO,
  PLUNDERBLADE,
  REWARD,
  SHINY,
  TRACK,
  WOUND
}

final conditionTypeValues = EnumValues({
  "carve": ConditionType.CARVE,
  "investigation": ConditionType.INVESTIGATION,
  "palico": ConditionType.PALICO,
  "plunderblade": ConditionType.PLUNDERBLADE,
  "reward": ConditionType.REWARD,
  "shiny": ConditionType.SHINY,
  "track": ConditionType.TRACK,
  "wound": ConditionType.WOUND
});

enum MonstersResponseType { LARGE, SMALL }

final monstersResponseTypeValues = EnumValues(
    {"large": MonstersResponseType.LARGE, "small": MonstersResponseType.SMALL});

class Weakness {
  Element element;
  int stars;
  String? condition;

  Weakness({
    required this.element,
    required this.stars,
    required this.condition,
  });

  factory Weakness.fromJson(Map<String, dynamic> json) => Weakness(
        element: elementValues.map[json["element"]]!,
        stars: json["stars"],
        condition: json["condition"],
      );
/*
  Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "stars": stars,
        "condition": condition,
      };*/
  @override
  String toString() {
    // Devuelve una cadena que representa la información de la instancia
    return '{Element: $element, Stars: $stars, condition: $condition}';
  }
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
