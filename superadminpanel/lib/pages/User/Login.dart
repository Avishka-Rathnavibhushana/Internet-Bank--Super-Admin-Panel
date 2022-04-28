import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  Color primaryColorLight = Color(0xFF1976D2);
  Color primaryColor = Color(0xFF2196F3);
  Color black12 = Color(0x1F000000);
  Color white = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLight.withOpacity(0.1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width <= 500
              ? (MediaQuery.of(context).size.width - 50)
              : 500,
          decoration: BoxDecoration(
            color: primaryColorLight.withOpacity(0.3),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Welcome to Super Admin Panel",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: usernameTextEditingController,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 10,
                  ),
                  filled: true,
                  enabled: true,
                  fillColor: primaryColorLight.withOpacity(0.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordTextEditingController,
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 10,
                  ),
                  filled: true,
                  enabled: true,
                  fillColor: primaryColorLight.withOpacity(0.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: primaryColor,
                splashColor: black12,
                onPressed: () async {
                  await Navigator.pushNamedAndRemoveUntil(context,
                      RouteNames.manageAdminUsers, ModalRoute.withName('/'));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
