import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:superadminpanel/api/api.dart';
import 'package:superadminpanel/constants/userData.dart';
import 'package:superadminpanel/modals/AdminUser.dart';
import 'package:superadminpanel/modals/AdminUserCredentials.dart';
import 'package:superadminpanel/modals/User.dart';
import 'package:superadminpanel/modals/UserData.dart';

class AuthAPIs {
  // login page
  static Future<bool> loginAPI(String username, String password) async {
    try {
      UserData appUser = UserData(password: password, username: username);
      Map<String, dynamic> requestBody = appUser.toJson();
      Map<String, String> requestHeader = {
        "Auth": "IB_USER",
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };

      Response res = await post(
        Uri.parse(BASE_URL_LOGIN + LOGIN),
        headers: {
          "Auth": "IB_USER",
          "content-type": "application/json",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: jsonEncode(requestBody),
      );

      if (res.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(res.body);
        User user = User.fromJson(body);

        bearer = user.token;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
