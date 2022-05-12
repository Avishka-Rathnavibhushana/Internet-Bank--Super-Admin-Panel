// To parse this JSON data, do
//
//     final adminUserCredential = adminUserCredentialFromJson(jsonString);

import 'dart:convert';

AdminUserCredential adminUserCredentialFromJson(String str) =>
    AdminUserCredential.fromJson(json.decode(str));

String adminUserCredentialToJson(AdminUserCredential data) =>
    json.encode(data.toJson());

class AdminUserCredential {
  AdminUserCredential({
    required this.objectuuid,
    required this.password,
    required this.role,
    required this.userid,
    required this.username,
  });

  String objectuuid;
  String password;
  String role;
  String userid;
  String username;

  factory AdminUserCredential.fromJson(Map<String, dynamic> json) =>
      AdminUserCredential(
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
        password: json["password"] == null ? "" : json["password"],
        role: json["role"] == null ? "" : json["role"],
        userid: json["userid"] == null ? "" : json["userid"],
        username: json["username"] == null ? "" : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "objectuuid": objectuuid == null ? "" : objectuuid,
        "password": password == null ? "" : password,
        "role": role == null ? "" : role,
        "userid": userid == null ? "" : userid,
        "username": username == null ? "" : username,
      };
}
