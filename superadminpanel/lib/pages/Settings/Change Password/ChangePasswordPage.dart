import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/CustomLabelContainer.dart';
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
      pageTitle: [PageTitles.setting, PageTitles.changePassword],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabelContainer(text: "Admin Change Password"),
                Center(
                  child: MainForm(
                    buttons: [
                      [
                        "Submit",
                        () => {print("1")},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Reset",
                        () => {print("1")},
                        AppColors.white,
                        Colors.black,
                        Colors.grey,
                      ],
                    ],
                    textFieldItems: [
                      [
                        "Current Login Password",
                        "TextField",
                        currentPasswordTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "New Login Password",
                        "TextField",
                        newPasswordTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Confirm New Login Password",
                        "TextField",
                        confirmNewPasswordTextEditingController,
                        true,
                        true,
                      ],
                    ],
                    topic: '',
                    isHeaderAvailable: false,
                    topicBackgroundColor: Colors.blue[100],
                    topicTextColor: Colors.blue[150],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
