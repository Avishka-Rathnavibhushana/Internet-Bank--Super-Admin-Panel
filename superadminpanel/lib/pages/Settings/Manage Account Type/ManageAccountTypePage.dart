import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ManageAccountTypePage extends StatefulWidget {
  ManageAccountTypePage({Key? key}) : super(key: key);

  @override
  State<ManageAccountTypePage> createState() => _ManageAccountTypePageState();
}

class _ManageAccountTypePageState extends State<ManageAccountTypePage> {
  String userName = "Avishka";
  String loginAttempts = "0";
  String status = "ACTIVE";
  String currentStatus = "ACTIVE";
  bool passwordLoginStatus = true;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.setting, PageTitles.manageAccountType],
      body: CustomPageView(
        items: [ResponsiveRowColumnItem(rowFlex: 1, child: Text("No UI"))],
      ),
    );
  }
}
