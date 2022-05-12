// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.companyid,
    this.contact,
    this.createdby,
    this.email,
    this.name,
    this.objectuuid,
    required this.password,
    this.role,
    this.userid,
    required this.username,
  });

  String? companyid;
  String? contact;
  String? createdby;
  String? email;
  String? name;
  String? objectuuid;
  String password;
  String? role;
  String? userid;
  String username;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        companyid: json["companyid"] == null ? "" : json["companyid"],
        contact: json["contact"] == null ? "" : json["contact"],
        createdby: json["createdby"] == null ? "" : json["createdby"],
        email: json["email"] == null ? "" : json["email"],
        name: json["name"] == null ? "" : json["name"],
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
        password: json["password"] == null ? "" : json["password"],
        role: json["role"] == null ? "" : json["role"],
        userid: json["userid"] == null ? "" : json["userid"],
        username: json["username"] == null ? "" : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "companyid": companyid == null ? "" : companyid,
        "contact": contact == null ? "" : contact,
        "createdby": createdby == null ? "" : createdby,
        "email": email == null ? "" : email,
        "name": name == null ? "" : name,
        "objectuuid": objectuuid == null ? "" : objectuuid,
        "password": password == null ? "" : password,
        "role": role == null ? "" : role,
        "userid": userid == null ? "" : userid,
        "username": username == null ? "" : username,
      };
}
