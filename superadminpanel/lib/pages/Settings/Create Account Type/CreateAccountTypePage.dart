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

class CreateAccountTypePage extends StatefulWidget {
  CreateAccountTypePage({Key? key}) : super(key: key);

  @override
  State<CreateAccountTypePage> createState() => _CreateAccountTypePageState();
}

class _CreateAccountTypePageState extends State<CreateAccountTypePage> {
  TextEditingController accountTypeTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.setting, PageTitles.createAccountType],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabelContainer(text: "Create Acount Type"),
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
                        "Account Type",
                        "TextField",
                        accountTypeTextEditingController,
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
