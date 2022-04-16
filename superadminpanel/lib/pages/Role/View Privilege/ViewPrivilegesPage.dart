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
      pageTitle: [PageTitles.role, PageTitles.viewPrivileges],
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
                    "",
                    "Table",
                    [
                      [
                        ["Label", "Code", false, true],
                        ["Label", "Name", false, true],
                        ["Label", "Description", false, true],
                        ["Label", "Type", false, true],
                      ],
                      [
                        ["Label", "2017", false, false],
                        ["Label", "ADMIN_BANK_SETTING", false, false],
                        ["Label", "Bank Settings", false, false],
                        ["Label", "BANK_ADMIN", false, false],
                      ],
                      [
                        ["Label", "2017", false, false],
                        ["Label", "ADMIN_BANK_SETTING", false, false],
                        ["Label", "Bank Settings", false, false],
                        ["Label", "BANK_ADMIN", false, false],
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
