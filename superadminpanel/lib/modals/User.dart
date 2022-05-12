// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.token,
    required this.role,
    required this.contact,
    required this.email,
    required this.userid,
    required this.name,
    required this.companyid,
    required this.objectuuid,
  });

  int id;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String token;
  String role;
  String contact;
  String email;
  String userid;
  String name;
  String companyid;
  String objectuuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? "" : json["id"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        token: json["token"] == null ? "" : json["token"],
        role: json["role"] == null ? "" : json["role"],
        contact: json["contact"] == null ? "" : json["contact"],
        email: json["email"] == null ? "" : json["email"],
        userid: json["userid"] == null ? "" : json["userid"],
        name: json["name"] == null ? "" : json["name"],
        companyid: json["companyid"] == null ? "" : json["companyid"],
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "token": token == null ? "" : token,
        "role": role == null ? "" : role,
        "contact": contact == null ? "" : contact,
        "email": email == null ? "" : email,
        "userid": userid == null ? "" : userid,
        "name": name == null ? "" : name,
        "companyid": companyid == null ? "" : companyid,
        "objectuuid": objectuuid == null ? "" : objectuuid,
      };
}
