import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreateAdminUserPage extends StatefulWidget {
  CreateAdminUserPage({Key? key}) : super(key: key);

  @override
  State<CreateAdminUserPage> createState() => _CreateAdminUserPageState();
}

class _CreateAdminUserPageState extends State<CreateAdminUserPage> {
  //form 1 data
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  String status = "MR";
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController confirmEmailTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();

  //form 2 data
  String passwordPolicy = "Admin";
  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController reTypePasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.adminUserManagement, PageTitles.createAdminUser],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: CustomPageView(
            items: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
                      textFieldItems: [
                        [
                          "Status",
                          "DropDownTextField",
                          ["MR", "MRS", "MS"],
                          status,
                          true,
                          (value) {
                            setState(() {
                              status = value!;
                            });
                          },
                        ],
                        [
                          "First Name",
                          "TextField",
                          firstNameTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Last Name",
                          "TextField",
                          lastNameTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "E-mail",
                          "TextField",
                          emailTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Confirm E-mail",
                          "TextField",
                          confirmEmailTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Employee id",
                          "TextField",
                          employeeIdTextEditingController,
                          true,
                          true,
                        ],
                      ],
                      topic: 'Personal Details',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
              ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
                      textFieldItems: [
                        [
                          "Password Policy",
                          "DropDownTextField",
                          ["Admin", "Customer"],
                          passwordPolicy,
                          true,
                          (value) {
                            setState(() {
                              passwordPolicy = value!;
                            });
                          },
                        ],
                        [
                          "User Id",
                          "TextField",
                          userIdTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Password",
                          "TextField",
                          passwordTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Retype Password",
                          "TextField",
                          reTypePasswordTextEditingController,
                          true,
                          true,
                        ],
                        ["", "Custom", Text("Note: User Id/Password minimum length 8..*", style: TextStyle(color: AppColors.primaryColor,),),],
                      ],
                      topic: 'User Name and Password',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
              ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MainForm(
                    isHeaderAvailable: true,
                    buttons: [
                      [
                        "Submit",
                        () {},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Reset",
                        () {},
                        Colors.grey[700],
                        AppColors.white,
                      ]
                    ],
                    textFieldItems: [
                      [
                        "",
                        "Table",
                        [
                          [
                            ["Label", "Role", false, true],
                            ["Label", "Description", false, true],
                            ["Label", "", false, true],
                          ],
                          [
                            ["CheckBox", false, (vale) {}],
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                          ],
                          [
                            ["CheckBox", false, (vale) {}],
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                          ],
                        ],
                      ],
                    ],
                    topic: 'Role',
                    topicBackgroundColor: Colors.blue[100],
                    topicTextColor: Colors.blue[150],
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
