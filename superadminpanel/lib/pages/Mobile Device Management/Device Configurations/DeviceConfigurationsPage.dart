import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/CreateUserGroupLimitsPage.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class DeviceConfigurationsPage extends StatefulWidget {
  DeviceConfigurationsPage({Key? key}) : super(key: key);

  @override
  State<DeviceConfigurationsPage> createState() =>
      _DeviceConfigurationsPageState();
}

class _DeviceConfigurationsPageState extends State<DeviceConfigurationsPage> {
  TextEditingController deviceCountTextEditingController =
      TextEditingController();

  String deviceCount = "Single Device";

  @override
  void initState() {
    setState(() {
      deviceCountTextEditingController.text = "1";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.mobileDeviceManagement,
        PageTitles.deviceConfigurations
      ],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [
                  [
                    "Update Configurations",
                    () => {print("1")},
                    AppColors.buttonLightGreenColor,
                    AppColors.white,
                  ],
                ],
                textFieldItems: [
                  [
                    "",
                    "Radio",
                    [
                      [
                        "Single Device",
                        deviceCount,
                        (value) {
                          setState(() {
                            deviceCount = "Single Device";
                            
                            deviceCountTextEditingController.text == "1";
                          });
                        }
                      ],
                      [
                        "Multiple Devices",
                        deviceCount,
                        (value) {
                          setState(() {
                            deviceCount = "Multiple Devices";
                            deviceCountTextEditingController.text == "2";
                          });
                        }
                      ],
                    ],
                  ],
                  [
                    "",
                    "TextField",
                    deviceCountTextEditingController,
                    true,
                    true,
                    deviceCount == "Single Device" ? false : true,
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
