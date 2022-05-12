// To parse this JSON data, do
//
//     final role = roleFromJson(jsonString);

import 'dart:convert';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());

class Role {
  Role({
    required this.description,
    required this.name,
    required this.objectuuid,
    required this.roletype,
    required this.isExpanded,
  });

  String description;
  String name;
  String objectuuid;
  String roletype;
  String isExpanded;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        description: json["description"] == null ? "" : json["description"],
        name: json["name"] == null ? "" : json["name"],
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
        roletype: json["roletype"] == null ? "" : json["roletype"],
        isExpanded: json["isExpanded"] == null ? "+" : json["isExpanded"],
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? "" : description,
        "name": name == null ? "" : name,
        "objectuuid": objectuuid == null ? "" : objectuuid,
        "roletype": roletype == null ? "" : roletype,
        "isExpanded": isExpanded == null ? null : isExpanded,
      };
}
