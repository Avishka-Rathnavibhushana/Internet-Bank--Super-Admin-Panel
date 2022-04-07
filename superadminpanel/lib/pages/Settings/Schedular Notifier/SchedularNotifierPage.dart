import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class SchedularNotifierPage extends StatefulWidget {
  SchedularNotifierPage({Key? key}) : super(key: key);

  @override
  State<SchedularNotifierPage> createState() => _SchedularNotifierPageState();
}

class _SchedularNotifierPageState extends State<SchedularNotifierPage> {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController OfficerNameTextEditingController =
      TextEditingController();
  TextEditingController yec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.schedularNotifier,
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [
                  [
                    "Approve",
                    () => {print("1")},
                    Colors.green[200],
                    Colors.white,
                  ],
                  [
                    "Reject",
                    () => {print("1")},
                    Colors.red[200],
                    Colors.white,
                  ],
                  [
                    "Reset",
                    () => {print("1")},
                    Colors.white,
                    Colors.black,
                    Colors.grey,
                  ],
                ],
                textFieldItems: [
                  [
                    "Phone Number",
                    "TextField",
                    phoneNumberTextEditingController,
                  ],
                  [
                    "Officer Name",
                    "TextField",
                    OfficerNameTextEditingController,
                  ],
                ],
                topic: 'User Status',
                topicBackgroundColor: Colors.blue[100],
                topicTextColor: Colors.blue[150],
              ),
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
                    "Admin Comment",
                    "Table",
                    [
                      [
                        ["Label", "#"],
                        ["Label", "Schedular Notifier Number"],
                        ["Label", "Officer Name"],
                        ["Label", "Action"],
                      ],
                      [
                        ["Label", "1"],
                        ["Label", ""],
                        ["Label", "Rumesh Rodrigo"],
                        ["TextLink", "Edit/Delete  ", () {}]
                      ],
                    ],
                  ],
                ],
                topic: 'User Status',
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
