import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/CreateUserGroupLimitsPage.dart';
import 'package:superadminpanel/widgets/CustomLabelContainer.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreatePrivilagePage extends StatefulWidget {
  CreatePrivilagePage({Key? key}) : super(key: key);

  @override
  State<CreatePrivilagePage> createState() => _CreatePrivilagePageState();
}

class _CreatePrivilagePageState extends State<CreatePrivilagePage> {
  TextEditingController privilegeNameTextEditingController =
      TextEditingController();
  TextEditingController codeTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  String category = "BANKING USER MANAGEMENT";
  String type = "BANK_ADMIN";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.role, PageTitles.createPrivileges],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabelContainer(text: "Create New Privilages"),
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
                        () {
                          print("2");
                        },
                        AppColors.white,
                        Colors.black,
                        Colors.grey,
                      ],
                    ],
                    textFieldItems: [
                      [
                        "Privilege Name",
                        "TextField",
                        privilegeNameTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Code",
                        "TextField",
                        codeTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Description",
                        "TextArea",
                        descriptionTextEditingController,
                        3,
                        true,
                        true,
                      ],
                      [
                        "Category",
                        "DropDownTextField",
                        ["BANKING USER MANAGEMENT", "BANKING CUSTOMER"],
                        category,
                        false,
                        (value) {
                          setState(() {
                            category = value!;
                          });
                        },
                      ],
                      [
                        "type",
                        "DropDownTextField",
                        ["BANK_ADMIN", "BANK_USER"],
                        type,
                        false,
                        (value) {
                          setState(() {
                            type = value!;
                          });
                        },
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
          ),
        ],
      ),
    );
  }
}
