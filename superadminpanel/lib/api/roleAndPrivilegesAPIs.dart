import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:superadminpanel/api/api.dart';
import 'package:superadminpanel/constants/userData.dart';
import 'package:superadminpanel/modals/Privilege.dart';
import 'package:superadminpanel/modals/Role.dart';

class RoleAndPrivilegesAPIs {
  // create roles page
  static Future<bool> createRoleAPI(Role roleModal) async {
    try {
      Map<String, dynamic> requestBody = roleModal.toJson();
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      Response res = await post(
        Uri.parse(BASE_URL + CREATE_ROLE_URL),
        headers: requestHeader,
        body: jsonEncode(requestBody),
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<List<Role>> findAllRoleAPI() async {
    try {
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      Response res = await get(
        Uri.parse(BASE_URL + FIND_ALL_ROLE_URL),
        headers: requestHeader,
      );
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body)['role'];

        List<Role> roles = body
            .map(
              (dynamic item) => Role.fromJson(item),
            )
            .toList();
        return roles;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // create privileges page
  static Future<bool> createPrivilegeAPI(Privilege privilageModal) async {
    try {
      Map<String, dynamic> requestBody = privilageModal.toJson();
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      Response res = await post(
        Uri.parse(BASE_URL + CREATE_PRIVILEGE_URL),
        headers: requestHeader,
        body: jsonEncode(requestBody),
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<List<Privilege>> findAllPrivilegeAPI() async {
    try {
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      Response res = await get(
        Uri.parse(BASE_URL + FIND_ALL_PRIVILEGE_URL),
        headers: requestHeader,
      );
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body)['privilege'];
        List<Privilege> privileges = body
            .map(
              (dynamic item) => Privilege.fromJson(item),
            )
            .toList();
        return privileges;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
