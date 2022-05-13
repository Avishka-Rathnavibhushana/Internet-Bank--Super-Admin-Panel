import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/CustomLabelContainer.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreateUserGroupLimitsPage extends StatefulWidget {
  const CreateUserGroupLimitsPage({Key? key}) : super(key: key);

  @override
  State<CreateUserGroupLimitsPage> createState() =>
      _CreateUserGroupLimitsPageState();
}

class _CreateUserGroupLimitsPageState extends State<CreateUserGroupLimitsPage> {
  TextEditingController yec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [
        PageTitles.setting,
        PageTitles.userGroupLimits,
        PageTitles.createUserGroupLimits
      ],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabelContainer(
                    text: "**Please fill all amount feild before submit."),
                Center(
                  child: MainForm(
                    isHeaderAvailable: false,
                    buttons: [
                      [
                        "Update",
                        () => {debugPrint("1")},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Reset",
                        () => {debugPrint("1")},
                        Colors.grey[700],
                        AppColors.white,
                      ],
                    ],
                    textFieldItems: [
                      ["", "Custom", TextLabel(text: "User Group: GOLD")],
                      [
                        "",
                        "Table",
                        [
                          [
                            ["Label", "", false, true],
                            ["Label", "Daily Limit", false, true],
                            ["Label", "Transaction Limit", false, true],
                            [
                              "Label",
                              "OTP initiation Sealing Value",
                              false,
                              true
                            ],
                          ],
                          [
                            ["Label", "Own account", false, true],
                            ["TextBox", yec],
                            ["TextBox", yec],
                            ["Label", "", false, false]
                          ],
                          [
                            [
                              "Label",
                              "3rd Party account within same bank",
                              false,
                              true
                            ],
                            ["TextBox", yec],
                            ["TextBox", yec],
                            ["TextBox", yec]
                          ],
                          [
                            [
                              "Label",
                              "3rd part account other bank and bill payments",
                              false,
                              true
                            ],
                            ["TextBox", yec],
                            ["TextBox", yec],
                            ["TextBox", yec]
                          ],
                          [
                            [
                              "Label",
                              "sPay anyone fund Transfers",
                              false,
                              true
                            ],
                            ["TextBox", yec],
                            ["TextBox", yec],
                            ["Label", "", false, false]
                          ],
                        ],
                      ],
                    ],
                    topic: 'User Status',
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

class TextLabel extends StatelessWidget {
  var text;
  TextLabel({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
