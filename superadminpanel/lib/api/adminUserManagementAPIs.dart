import 'dart:convert';

import 'package:http/http.dart';
import 'package:superadminpanel/api/api.dart';
import 'package:superadminpanel/constants/userData.dart';
import 'package:superadminpanel/modals/AdminUser.dart';

class AdminUserManagementAPIS {
  // manage admin users page
  static Future<List<AdminUser>> findAllAdminAPI() async {
    Response res = await get(
      Uri.parse(BASE_URL + FIND_ALL_ADMIN_API_URL),
      headers: {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['admin'];
      List<AdminUser> adminUsers = body
          .map(
            (dynamic item) => AdminUser.fromJson(item),
          )
          .toList();
      return adminUsers;
    } else {
      return [];
    }
  }

  // admin user creaton page
  static Future<bool> createAdmin(AdminUser adminUser) async {
    try {
      Map<String, dynamic> requestBodyAdminUser = adminUser.toJson();
      // Map<String, dynamic> requestBodyAdminUserCredential = adminUser.toJson();
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "Authorization": "Bearer $bearer",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      Response userRes = await post(
        Uri.parse(BASE_URL + CREATE_ADMIN_PERSONAL_DETAILS_API_URL),
        headers: requestHeader,
        body: jsonEncode(requestBodyAdminUser),
      );
      if (userRes.statusCode == 200) {
        // Response credRes = await post(
        //   Uri.parse(BASE_URL + CREATE_ADMIN_CREDENTIALS_API_URL),
        //   headers: requestHeader,
        //   body: jsonEncode(requestBodyAdminUserCredential),
        // );
        // if (credRes.statusCode == 200) {
        //   return true;
        // } else {
        //   return false;
        // }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
