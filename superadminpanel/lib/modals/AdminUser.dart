// To parse this JSON data, do
//
//     final adminUser = adminUserFromJson(jsonString);

import 'dart:convert';

AdminUser adminUserFromJson(String str) => AdminUser.fromJson(json.decode(str));

String adminUserToJson(AdminUser data) => json.encode(data.toJson());

class AdminUser {
  AdminUser({
    required this.address,
    required this.adminrole,
    required this.contact,
    required this.email,
    required this.employeeid,
    required this.fname,
    required this.lname,
    required this.nicnumber,
    required this.objectuuid,
    required this.password,
    required this.passwordpolicy,
    required this.status,
    required this.userid,
  });

  String address;
  String adminrole;
  String contact;
  String email;
  String employeeid;
  String fname;
  String lname;
  String nicnumber;
  String objectuuid;
  String password;
  String passwordpolicy;
  String status;
  String userid;

  factory AdminUser.fromJson(Map<String, dynamic> json) => AdminUser(
        address: json["address"] == null ? "" : json["address"],
        adminrole: json["adminrole"] == null ? "" : json["adminrole"],
        contact: json["contact"] == null ? "" : json["contact"],
        email: json["email"] == null ? "" : json["email"],
        employeeid: json["employeeid"] == null ? "" : json["employeeid"],
        fname: json["fname"] == null ? "" : json["fname"],
        lname: json["lname"] == null ? "" : json["lname"],
        nicnumber: json["nicnumber"] == null ? "" : json["nicnumber"],
        objectuuid: json["objectuuid"] == null ? "" : json["objectuuid"],
        password: json["password"] == null ? "" : json["password"],
        passwordpolicy:
            json["passwordpolicy"] == null ? null : json["passwordpolicy"],
        status: json["status"] == null ? null : json["status"],
        userid: json["userid"] == null ? null : json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? "" : address,
        "adminrole": adminrole == null ? "" : adminrole,
        "contact": contact == null ? "" : contact,
        "email": email == null ? "" : email,
        "employeeid": employeeid == null ? "" : employeeid,
        "fname": fname == null ? "" : fname,
        "lname": lname == null ? "" : lname,
        "nicnumber": nicnumber == null ? "" : nicnumber,
        "objectuuid": objectuuid == null ? "" : objectuuid,
        "password": password == null ? "" : password,
        "passwordpolicy": passwordpolicy == null ? "" : passwordpolicy,
        "status": status == null ? "" : status,
        "userid": userid == null ? "" : userid,
      };
}
