import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class AdminUserUpdate extends StatefulWidget {
  AdminUserUpdate({Key? key}) : super(key: key);

  @override
  State<AdminUserUpdate> createState() => _AdminUserUpdateState();
}

class _AdminUserUpdateState extends State<AdminUserUpdate> {
  //form data
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  String status = "MR";
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController confirmEmailTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppScaffold(
      pageTitle: const [
        PageTitles.adminUserManagement,
        PageTitles.manageAdminUsers, PageTitles.adminUserUpdate],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: CustomPageView(
            items: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Center(
                  child: MainForm(
                    buttons: [
                      [
                        "Update",
                        () => {print("1")},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Reset",
                        () => {print("2")},
                        Colors.grey[700],
                        AppColors.white,
                      ]
                    ],
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
                        false, // validation
                      ],
                      [
                        "Last Name",
                        "TextField",
                        lastNameTextEditingController,
                        true,
                        true,
                        false, // validation
                      ],
                      [
                        "E-mail",
                        "TextField",
                        emailTextEditingController,
                        true,
                        true,
                        false, // validation
                      ],
                      [
                        "Confirm E-mail",
                        "TextField",
                        confirmEmailTextEditingController,
                        true,
                        true,
                        false, // validation
                      ],
                      [
                        "Employee id",
                        "TextField",
                        employeeIdTextEditingController,
                        true,
                        true,
                        false, // validation
                      ],
                    ],
                    topic: 'Personal Details',
                    topicBackgroundColor: Colors.blue[100],
                    topicTextColor: Colors.blue[150],
                  ),
                ),
              ),
              const ResponsiveRowColumnItem(
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
                    buttons: [],
                    textFieldItems: [
                      [
                        "",
                        "Table",
                        [
                          [
                            ["Label", "Role Name", false, true],
                            ["Label", "Description", false, true],
                            ["Label", "Action", false, true],
                          ],
                          [
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                            ["CheckBox", false, (vale) {}]
                          ],
                          [
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                            ["CheckBox", false, (vale) {}]
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
