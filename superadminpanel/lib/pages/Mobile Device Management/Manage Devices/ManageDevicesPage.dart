import 'dart:html';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/utils/Utils.dart';
import 'package:superadminpanel/widgets/MainForm/ClickableList.dart';
import 'package:superadminpanel/widgets/MainForm/MainFormHorizontal.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ManageDevicesPage extends StatefulWidget {
  ManageDevicesPage({Key? key}) : super(key: key);

  @override
  State<ManageDevicesPage> createState() => _ManageDevicesPageState();
}

class _ManageDevicesPageState extends State<ManageDevicesPage> {
  //form data
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController uuidTextEditingController = TextEditingController();
  TextEditingController imeiTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.mobileDeviceManagement, PageTitles.manageDevices],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainFormHorizontal(
                buttons: [
                  [
                    "Submit",
                    () => {print("1")},
                    AppColors.buttonLightGreenColor,
                    AppColors.white,
                  ],
                  [
                    "Reset",
                    () {},
                    Colors.grey,
                    Colors.white,
                  ],
                ],
                textFieldItems: [
                  [
                    "User Name",
                    "TextField",
                    userNameTextEditingController,
                    true,
                    true,
                  ],
                  [
                    "UUID",
                    "TextField",
                    uuidTextEditingController,
                    true,
                    true,
                  ],
                  [
                    "IMEI",
                    "TextField",
                    uuidTextEditingController,
                    true,
                    true,
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
