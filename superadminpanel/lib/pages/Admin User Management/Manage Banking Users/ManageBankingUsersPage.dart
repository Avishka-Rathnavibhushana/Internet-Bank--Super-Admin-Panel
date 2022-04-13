import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ManageBankingUsersPage extends StatefulWidget {
  ManageBankingUsersPage({Key? key}) : super(key: key);

  @override
  State<ManageBankingUsersPage> createState() => _ManageBankingUsersPageState();
}

class _ManageBankingUsersPageState extends State<ManageBankingUsersPage> {
  String userName = "Avishka";
  String loginAttempts = "0";
  String status = "ACTIVE";
  String currentStatus = "ACTIVE";
  bool passwordLoginStatus = true;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.adminUserManagement,
        PageTitles.manageBankingUsers
      ],
      body: CustomPageView(
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
                ],
                textFieldItems: [
                  [
                    "User Name:",
                    "LabelField",
                    userName,
                  ],
                  [
                    "Login Attempts:",
                    "LabelField",
                    loginAttempts,
                  ],
                  [
                    "Current Status:",
                    "LabelField",
                    currentStatus,
                  ],
                  [
                    "",
                    "DropDownTextField",
                    ["ACTIVE", "DEACTIVE"],
                    status,
                    true,
                    (value) {
                      setState(() {
                        status = value!;
                      });
                    },
                  ],
                  [
                    "Reset login password",
                    "CkeckBoxField",
                    passwordLoginStatus,
                    (value) {
                      setState(() {
                        passwordLoginStatus = value;
                      });
                    },
                  ],
                ],
                topic: 'User Status',
                topicBackgroundColor: Colors.blue[100],
                topicTextColor: Colors.blue[150],
              ),
            ),
          )
        ],
      ),
    );
  }
}
