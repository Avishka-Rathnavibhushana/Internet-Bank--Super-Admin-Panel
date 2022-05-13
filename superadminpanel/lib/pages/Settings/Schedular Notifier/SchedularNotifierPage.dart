import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/CustomLabelContainer.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class SchedularNotifierPage extends StatefulWidget {
  const SchedularNotifierPage({Key? key}) : super(key: key);

  @override
  State<SchedularNotifierPage> createState() => _SchedularNotifierPageState();
}

class _SchedularNotifierPageState extends State<SchedularNotifierPage> {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController officerNameTextEditingController =
      TextEditingController();
  TextEditingController yec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [PageTitles.setting, PageTitles.schedularNotifier],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabelContainer(text: "Admin Schedular Notifier"),
                Center(
                  child: MainForm(
                    buttons: [
                      [
                        "Update",
                        () => {print("1")},
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Delete",
                        () => {print("1")},
                        Colors.red[200],
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
                        "Phone Number",
                        "TextField",
                        phoneNumberTextEditingController,
                        true,
                        true,
                        false, // validation
                      ],
                      [
                        "Officer Name",
                        "TextField",
                        officerNameTextEditingController,
                        true,
                        true,
                        false, // validation
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
          ResponsiveRowColumnItem(
            child: SizedBox(
              height: 20,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                isHeaderAvailable: false,
                buttons: [],
                textFieldItems: [
                  [
                    "",
                    "Table",
                    [
                      [
                        ["Label", "#", false, true],
                        ["Label", "Schedular Notifier Number", false, true],
                        ["Label", "Officer Name", false, true],
                        ["Label", "Action", false, true],
                      ],
                      [
                        ["Label", "1", false, false],
                        ["Label", "", false, false],
                        ["Label", "Rumesh Rodrigo", false, false],
                        ["TextLink", "Edit/Delete  ", () {}]
                      ],
                    ],
                  ],
                ],
                topic: '',
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
