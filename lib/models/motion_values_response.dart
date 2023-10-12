import 'package:meta/meta.dart';
import 'dart:convert';

class MotionValuesResponse {
  int id;
  WeaponType weaponType;
  DamageType damageType;
  int stun;
  int exhaust;
  List<int> hits;
  String name;

  MotionValuesResponse({
    required this.id,
    required this.weaponType,
    required this.damageType,
    required this.stun,
    required this.exhaust,
    required this.hits,
    required this.name,
  });

  factory MotionValuesResponse.fromRawJson(String str) =>
      MotionValuesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MotionValuesResponse.fromJson(Map<String, dynamic> json) =>
      MotionValuesResponse(
        id: json["id"],
        weaponType: weaponTypeValues.map[json["weaponType"]]!,
        damageType: damageTypeValues.map[json["damageType"]]!,
        stun: json["stun"],
        exhaust: json["exhaust"],
        hits: List<int>.from(json["hits"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weaponType": weaponTypeValues.reverse[weaponType],
        "damageType": damageTypeValues.reverse[damageType],
        "stun": stun,
        "exhaust": exhaust,
        "hits": List<dynamic>.from(hits.map((x) => x)),
        "name": name,
      };
}

enum DamageType { BLUNT, PROJECTILE, SEVER, SEVER_BLUNT }

final damageTypeValues = EnumValues({
  "blunt": DamageType.BLUNT,
  "projectile": DamageType.PROJECTILE,
  "sever": DamageType.SEVER,
  "sever + blunt": DamageType.SEVER_BLUNT
});

enum WeaponType {
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

final weaponTypeValues = EnumValues({
  "bow": WeaponType.BOW,
  "charge-blade": WeaponType.CHARGE_BLADE,
  "dual-blades": WeaponType.DUAL_BLADES,
  "great-sword": WeaponType.GREAT_SWORD,
  "gunlance": WeaponType.GUNLANCE,
  "hammer": WeaponType.HAMMER,
  "heavy-bowgun": WeaponType.HEAVY_BOWGUN,
  "hunting-horn": WeaponType.HUNTING_HORN,
  "insect-glaive": WeaponType.INSECT_GLAIVE,
  "lance": WeaponType.LANCE,
  "light-bowgun": WeaponType.LIGHT_BOWGUN,
  "long-sword": WeaponType.LONG_SWORD,
  "switch-axe": WeaponType.SWITCH_AXE,
  "sword-and-shield": WeaponType.SWORD_AND_SHIELD
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
