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

class EMailConfigurationPage extends StatefulWidget {
  EMailConfigurationPage({Key? key}) : super(key: key);

  @override
  State<EMailConfigurationPage> createState() => _EMailConfigurationPageState();
}

class _EMailConfigurationPageState extends State<EMailConfigurationPage> {
  String transferLimitEmail = "Activate";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.systemConfiguration,
        PageTitles.emailConfigurationPageTopic
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
                    text: "IB Email Activate/Deactivate Configurations"),
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
                            ["Label", "TRANSFER_LIMIT_EMAIL", false, false],
                            [
                              "Radio",
                              "Activate",
                              (value) {
                                setState(() {
                                  transferLimitEmail = value;
                                });
                              },
                              transferLimitEmail
                            ],
                            [
                              "Radio",
                              "Deactivate",
                              (value) {
                                setState(() {
                                  transferLimitEmail = "Deactivate";
                                });
                              },
                              transferLimitEmail
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
