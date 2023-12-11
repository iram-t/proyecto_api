import 'package:meta/meta.dart';
import 'dart:convert';

class EventsResponse {
  int id;
  Platform platform;
  dynamic exclusive;
  Type type;
  Expansion expansion;
  int questRank;
  bool masterRank;
  StartTimestamp startTimestamp;
  EndTimestamp endTimestamp;
  String name;
  String description;
  String requirements;
  String successConditions;
  Location location;

  EventsResponse({
    required this.id,
    required this.platform,
    required this.exclusive,
    required this.type,
    required this.expansion,
    required this.questRank,
    required this.masterRank,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.name,
    required this.description,
    required this.requirements,
    required this.successConditions,
    required this.location,
  });

  factory EventsResponse.fromRawJson(String str) =>
      EventsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
        id: json["id"],
        platform: platformValues.map[json["platform"]]!,
        exclusive: json["exclusive"],
        type: typeValues.map[json["type"]]!,
        expansion: expansionValues.map[json["expansion"]]!,
        questRank: json["questRank"],
        masterRank: json["masterRank"],
        startTimestamp: startTimestampValues.map[json["startTimestamp"]]!,
        endTimestamp: endTimestampValues.map[json["endTimestamp"]]!,
        name: json["name"],
        description: json["description"],
        requirements: json["requirements"],
        successConditions: json["successConditions"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "platform": platformValues.reverse[platform],
        "exclusive": exclusive,
        "type": typeValues.reverse[type],
        "expansion": expansionValues.reverse[expansion],
        "questRank": questRank,
        "masterRank": masterRank,
        "startTimestamp": startTimestampValues.reverse[startTimestamp],
        "endTimestamp": endTimestampValues.reverse[endTimestamp],
        "name": name,
        "description": description,
        "requirements": requirements,
        "successConditions": successConditions,
        "location": location.toJson(),
      };
}

enum EndTimestamp {
  THE_20201203_T23_59000000,
  THE_20201210_T23_59000000,
  THE_20201217_T23_59000000,
  THE_20201231_T23_59000000
}

final endTimestampValues = EnumValues({
  "2020-12-03T23:59:00+0000": EndTimestamp.THE_20201203_T23_59000000,
  "2020-12-10T23:59:00+0000": EndTimestamp.THE_20201210_T23_59000000,
  "2020-12-17T23:59:00+0000": EndTimestamp.THE_20201217_T23_59000000,
  "2020-12-31T23:59:00+0000": EndTimestamp.THE_20201231_T23_59000000
});

enum Expansion { BASE }

final expansionValues = EnumValues({"base": Expansion.BASE});

class Location {
  int id;
  int zoneCount;
  LocationName name;
  List<Camp> camps;

  Location({
    required this.id,
    required this.zoneCount,
    required this.name,
    required this.camps,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        zoneCount: json["zoneCount"],
        name: locationNameValues.map[json["name"]]!,
        camps: List<Camp>.from(json["camps"].map((x) => Camp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zoneCount": zoneCount,
        "name": locationNameValues.reverse[name],
        "camps": List<dynamic>.from(camps.map((x) => x.toJson())),
      };
}

class Camp {
  int id;
  int zone;
  CampName name;

  Camp({
    required this.id,
    required this.zone,
    required this.name,
  });

  factory Camp.fromRawJson(String str) => Camp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Camp.fromJson(Map<String, dynamic> json) => Camp(
        id: json["id"],
        zone: json["zone"],
        name: campNameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zone": zone,
        "name": campNameValues.reverse[name],
      };
}

enum CampName {
  ANCIENT_FOREST_CAMP,
  CAMP,
  CENTRAL_CAMP,
  EASTERN_CAMP,
  NORTHEAST_CAMP,
  NORTHWEST_CAMP,
  SOUTHEAST_CAMP,
  SOUTHERN_CAMP,
  SOUTHWEST_CAMP
}

final campNameValues = EnumValues({
  "Ancient Forest Camp": CampName.ANCIENT_FOREST_CAMP,
  "Camp": CampName.CAMP,
  "Central Camp": CampName.CENTRAL_CAMP,
  "Eastern Camp": CampName.EASTERN_CAMP,
  "Northeast Camp": CampName.NORTHEAST_CAMP,
  "Northwest Camp": CampName.NORTHWEST_CAMP,
  "Southeast Camp": CampName.SOUTHEAST_CAMP,
  "Southern Camp": CampName.SOUTHERN_CAMP,
  "Southwest Camp": CampName.SOUTHWEST_CAMP
});

enum LocationName {
  ANCIENT_FOREST,
  ARENA,
  CAVERNS_OF_EL_DORADO,
  CONFLUENCE_OF_FATES,
  CORAL_HIGHLANDS,
  ELDER_S_RECESS,
  EVERSTREAM,
  ROTTEN_VALE,
  SPECIAL_ARENA,
  WILDSPIRE_WASTE
}

final locationNameValues = EnumValues({
  "Ancient Forest": LocationName.ANCIENT_FOREST,
  "Arena": LocationName.ARENA,
  "Caverns of El Dorado": LocationName.CAVERNS_OF_EL_DORADO,
  "Confluence of Fates": LocationName.CONFLUENCE_OF_FATES,
  "Coral Highlands": LocationName.CORAL_HIGHLANDS,
  "Elder's Recess": LocationName.ELDER_S_RECESS,
  "Everstream": LocationName.EVERSTREAM,
  "Rotten Vale": LocationName.ROTTEN_VALE,
  "Special Arena": LocationName.SPECIAL_ARENA,
  "Wildspire Waste": LocationName.WILDSPIRE_WASTE
});

enum Platform { CONSOLE, PC }

final platformValues =
    EnumValues({"console": Platform.CONSOLE, "pc": Platform.PC});

enum StartTimestamp {
  THE_20201113_T00_00000000,
  THE_20201120_T00_00000000,
  THE_20201127_T00_00000000,
  THE_20201204_T00_00000000,
  THE_20201211_T00_00000000
}

final startTimestampValues = EnumValues({
  "2020-11-13T00:00:00+0000": StartTimestamp.THE_20201113_T00_00000000,
  "2020-11-20T00:00:00+0000": StartTimestamp.THE_20201120_T00_00000000,
  "2020-11-27T00:00:00+0000": StartTimestamp.THE_20201127_T00_00000000,
  "2020-12-04T00:00:00+0000": StartTimestamp.THE_20201204_T00_00000000,
  "2020-12-11T00:00:00+0000": StartTimestamp.THE_20201211_T00_00000000
});

enum Type { CHALLENGE_QUEST, EVENT_QUEST, KULVE_TAROTH_SIEGE }

final typeValues = EnumValues({
  "challenge quest": Type.CHALLENGE_QUEST,
  "event quest": Type.EVENT_QUEST,
  "kulve taroth siege": Type.KULVE_TAROTH_SIEGE
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
