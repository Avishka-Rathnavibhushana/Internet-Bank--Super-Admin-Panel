import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class BankSettingPage extends StatefulWidget {
  BankSettingPage({Key? key}) : super(key: key);

  @override
  State<BankSettingPage> createState() => _BankSettingPageState();
}

class _BankSettingPageState extends State<BankSettingPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.bankSetting,
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text("No UI"),
          )
        ],
      ),
    );
  }
}
