// To parse this JSON data, do
//
//     final privilege = privilegeFromJson(jsonString);

import 'dart:convert';

Privilege privilegeFromJson(String str) => Privilege.fromJson(json.decode(str));

String privilegeToJson(Privilege data) => json.encode(data.toJson());

class Privilege {
  Privilege({
    required this.category,
    required this.code,
    required this.description,
    required this.name,
    required this.objectuuid,
    required this.type,
  });

  String category;
  String code;
  String description;
  String name;
  String objectuuid;
  String type;

  factory Privilege.fromJson(Map<String, dynamic> json) => Privilege(
        category: json["category"] == null ? "" : json["category"],
        code: json["code"] == null ? "" : json["code"],
        description: json["description"] == null ? "" : json["description"],
        name: json["name"] == null ? "" : json["name"],
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
        type: json["type"] == null ? "" : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? "" : category,
        "code": code == null ? "" : code,
        "description": description == null ? "" : description,
        "name": name == null ? "" : name,
        "objectuuid": objectuuid == null ? "" : objectuuid,
        "type": type == null ? "" : type,
      };
}
