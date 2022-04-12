import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class GlobalSwitchPage extends StatefulWidget {
  GlobalSwitchPage({Key? key}) : super(key: key);

  @override
  State<GlobalSwitchPage> createState() => _GlobalSwitchPageState();
}

class _GlobalSwitchPageState extends State<GlobalSwitchPage> {
  String internetBankingRadio = "Activate";
  String mobileRadio = "Activate";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.globalSwitchPageTopic,
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
                        ["Label", "INTERNET_BANKING"],
                        [
                          "Radio",
                          "Activate",
                          (value) {
                            setState(() {
                              internetBankingRadio = value;
                            });
                          },
                          internetBankingRadio
                        ],
                        [
                          "Radio",
                          "Deactivate",
                          (value) {
                            setState(() {
                              internetBankingRadio = "Deactivate";
                            });
                          },
                          internetBankingRadio
                        ],
                      ],
                      [
                        ["Label", "MOBILE"],
                        [
                          "Radio",
                          "Activate",
                          (value) {
                            setState(() {
                              mobileRadio = "Activate";
                            });
                          },
                          mobileRadio
                        ],
                        [
                          "Radio",
                          "Deactivate",
                          (value) {
                            setState(() {
                              mobileRadio = "Deactivate";
                            });
                          },
                          mobileRadio
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
