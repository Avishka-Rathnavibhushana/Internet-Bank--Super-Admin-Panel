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

class SecurityViewConfigurationPage extends StatefulWidget {
  SecurityViewConfigurationPage({Key? key}) : super(key: key);

  @override
  State<SecurityViewConfigurationPage> createState() =>
      _SecurityViewConfigurationPageState();
}

class _SecurityViewConfigurationPageState
    extends State<SecurityViewConfigurationPage> {
  String securityQuestionViews = "Activate";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.systemConfiguration,
        PageTitles.securityViewConfigurationPageTopic
      ],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabelContainer(
                    text:
                        "Internet Banking Activate/Deactivate Configuartions"),
                Center(
                  child: MainForm(
                    buttons: [
                      [
                        "Submit",
                        () => {print("1")},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                    ],
                    textFieldItems: [
                      [
                        "",
                        "Table",
                        [
                          [
                            ["Label", "", false, true],
                            ["Label", "Activate", false, true],
                            ["Label", "Deactivate", false, true],
                          ],
                          [
                            ["Label", "SECURITY_QUESTION_VIEWS", false, false],
                            [
                              "Radio",
                              "Activate",
                              (value) {
                                setState(() {
                                  securityQuestionViews = value;
                                });
                              },
                              securityQuestionViews
                            ],
                            [
                              "Radio",
                              "Deactivate",
                              (value) {
                                setState(() {
                                  securityQuestionViews = "Deactivate";
                                });
                              },
                              securityQuestionViews
                            ],
                          ],
                        ],
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
