import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CommonConfigurationPage extends StatefulWidget {
  CommonConfigurationPage({Key? key}) : super(key: key);

  @override
  State<CommonConfigurationPage> createState() =>
      _CommonConfigurationPageState();
}

class _CommonConfigurationPageState extends State<CommonConfigurationPage> {
  String creditCard = "Activate";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.securityViewConfigurationPageTopic,
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
                    AppColors.buttonLightGreenColor,
                    AppColors.white,
                  ],
                ],
                textFieldItems: [
                  [
                    "Admin Comment",
                    "Table",
                    [
                      [
                        ["Label", ""],
                        ["Label", "Activate"],
                        ["Label", "Deactivate"],
                      ],
                      [
                        ["Label", "CREDIT_CARD"],
                        [
                          "Radio",
                          "Activate",
                          (value) {
                            setState(() {
                              creditCard = value;
                            });
                          },
                          creditCard
                        ],
                        [
                          "Radio",
                          "Deactivate",
                          (value) {
                            setState(() {
                              creditCard = "Deactivate";
                            });
                          },
                          creditCard
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
          ),
        ],
      ),
    );
  }
}
