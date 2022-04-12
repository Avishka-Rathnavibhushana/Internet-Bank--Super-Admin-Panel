import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/utils/Utils.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class UserGroupLimitsPage extends StatefulWidget {
  UserGroupLimitsPage({Key? key}) : super(key: key);

  @override
  State<UserGroupLimitsPage> createState() => _UserGroupLimitsPageState();
}

class _UserGroupLimitsPageState extends State<UserGroupLimitsPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.setting, PageTitles.userGroupLimits],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [],
                textFieldItems: [
                  [
                    "Admin Comment",
                    "Table",
                    [
                      [
                        ["Label", "Title"],
                        [
                          "TextLink",
                          "MISS",
                          () async {
                            await Utils.navigateTo(context,
                                RouteNames.createUserGroupLimits, false);
                          }
                        ]
                      ],
                      // [
                      //   ["Title"],
                      //   [
                      //     "MISS",
                      //     () {
                      //       print("data");
                      //     }
                      //   ]
                      // ],
                      // [
                      //   ["Title"],
                      //   [
                      //     "MISS",
                      //     () {
                      //       print("data");
                      //     }
                      //   ]
                      // ],
                    ],
                  ],
                ],
                topic: 'User Status',
                topicBackgroundColor: Colors.blue[100],
                topicTextColor: Colors.blue[150],
              ),
            ),
          )
        ],
      ),
    );
  }
}
