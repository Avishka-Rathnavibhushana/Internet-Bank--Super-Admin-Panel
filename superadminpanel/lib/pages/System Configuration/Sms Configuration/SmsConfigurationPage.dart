import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class SmsConfigurationPage extends StatefulWidget {
  SmsConfigurationPage({Key? key}) : super(key: key);

  @override
  State<SmsConfigurationPage> createState() => _SmsConfigurationPageState();
}

class _SmsConfigurationPageState extends State<SmsConfigurationPage> {
  String ceftSms = "Activate";
  String slipSms = "Activate";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.systemConfiguration,
        PageTitles.smsConfigurationPageTopic
      ],
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
                        ["Label", "CEFT_SMS"],
                        [
                          "Radio",
                          "Activate",
                          (value) {
                            setState(() {
                              ceftSms = value;
                            });
                          },
                          ceftSms
                        ],
                        [
                          "Radio",
                          "Deactivate",
                          (value) {
                            setState(() {
                              ceftSms = "Deactivate";
                            });
                          },
                          ceftSms
                        ],
                      ],
                      [
                        ["Label", "SLIP_SMS"],
                        [
                          "Radio",
                          "Activate",
                          (value) {
                            setState(() {
                              slipSms = "Activate";
                            });
                          },
                          slipSms
                        ],
                        [
                          "Radio",
                          "Deactivate",
                          (value) {
                            setState(() {
                              slipSms = "Deactivate";
                            });
                          },
                          slipSms
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
