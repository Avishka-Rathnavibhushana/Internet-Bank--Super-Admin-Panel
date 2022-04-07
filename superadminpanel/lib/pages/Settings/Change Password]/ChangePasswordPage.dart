import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController currentPasswordTextEditingController =
      TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confirmNewPasswordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.changePassword,
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [
                  [
                    "Submit",
                    () => {print("1")},
                    Colors.green[200],
                    Colors.white,
                  ],
                  [
                    "Reset",
                    () => {print("1")},
                    Colors.white,
                    Colors.black,
                    Colors.grey,
                  ],
                ],
                textFieldItems: [
                  [
                    "Current Login Password",
                    "TextField",
                    currentPasswordTextEditingController,
                  ],
                  [
                    "New Login Password",
                    "TextField",
                    newPasswordTextEditingController,
                  ],
                  [
                    "Confirm New Login Password",
                    "TextField",
                    confirmNewPasswordTextEditingController,
                  ],
                ],
                topic: 'Change Password',
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
