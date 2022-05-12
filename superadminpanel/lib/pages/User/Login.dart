import 'package:flutter/material.dart';
import 'package:superadminpanel/api/authAPI.dart';
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

  bool loading = false;
  bool error = false;
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLight.withOpacity(0.1),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome to Super Admin Panel",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: usernameTextEditingController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Colors.black),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                        filled: true,
                        enabled: true,
                        fillColor: primaryColorLight.withOpacity(0.0),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.black),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                        filled: true,
                        enabled: true,
                        fillColor: primaryColorLight.withOpacity(0.0),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    error
                        ? Text(
                            errorText,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : Container(),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: primaryColor,
                      splashColor: black12,
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        String username = usernameTextEditingController.text;
                        String password = usernameTextEditingController.text;
                        if (username == "" || password == "") {
                          setState(() {
                            error = true;
                            errorText = "Check fields";
                          });
                          print("Check field validity.");
                        } else {
                          bool loggedIn =
                              await AuthAPIs.loginAPI(username, password);
                          if (loggedIn) {
                            await Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteNames.manageAdminUsers,
                                ModalRoute.withName('/'));
                            setState(() {
                              error = true;
                            });
                          } else {
                            setState(() {
                              loading = false;
                              error = true;
                              errorText =
                                  "Username or password is wrong please check again.";
                            });
                          }
                        }
                        setState(() {
                          loading = false;
                        });
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
