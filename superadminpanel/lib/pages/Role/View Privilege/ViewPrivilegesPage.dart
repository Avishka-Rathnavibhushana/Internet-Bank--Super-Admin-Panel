import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ViewPrivilegesPagePage extends StatefulWidget {
  ViewPrivilegesPagePage({Key? key}) : super(key: key);

  @override
  State<ViewPrivilegesPagePage> createState() => _ViewPrivilegesPagePageState();
}

class _ViewPrivilegesPagePageState extends State<ViewPrivilegesPagePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.viewPrivileges,
      body: CustomPageView(
        items: [
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
                        ["Label", "Code"],
                        ["Label", "Name"],
                        ["Label", "Description"],
                        ["Label", "Type"],
                      ],
                      [
                        ["Label", "2017"],
                        ["Label", "ADMIN_BANK_SETTING"],
                        ["Label", "Bank Settings"],
                        ["Label", "BANK_ADMIN"],
                      ],
                      [
                        ["Label", "2017"],
                        ["Label", "ADMIN_BANK_SETTING"],
                        ["Label", "Bank Settings"],
                        ["Label", "BANK_ADMIN"],
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
