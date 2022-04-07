import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/CreateUserGroupLimitsPage.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ConfigureAccountTypePage extends StatefulWidget {
  ConfigureAccountTypePage({Key? key}) : super(key: key);

  @override
  State<ConfigureAccountTypePage> createState() =>
      _ConfigureAccountTypePageState();
}

class _ConfigureAccountTypePageState extends State<ConfigureAccountTypePage> {
  String accountType = "Saving Account";
  String accountTable = "Account_history";
  TextEditingController yec = TextEditingController();
  bool checkBoxVal = true;
  List<Map<String, dynamic>> data = [
    {
      "username": "Avishka",
      "employeeid": "00001520",
      "title": "MR",
      "firstname": "Avishka",
      "lastname": "Rathnavibushana",
    },
    {
      "username": "Avishka",
      "employeeid": "00001520",
      "title": "MR",
      "firstname": "Avishka",
      "lastname": "Rathnavibushana",
    },
    {
      "username": "Avishka",
      "employeeid": "00001520",
      "title": "MR",
      "firstname": "Avishka",
      "lastname": "Rathnavibushana",
    },
  ];

  List<DatatableHeader> headers = [
    DatatableHeader(
        text: "User Name",
        value: "username",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Employee Id",
        value: "employeeid",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Title",
        value: "title",
        show: true,
        sortable: true,
        flex: 1,
        textAlign: TextAlign.left),
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.configureAccountType,
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [
                  [
                    "Save",
                    () => {print("1")},
                    Colors.green[200],
                    Colors.white,
                  ],
                ],
                textFieldItems: [
                  [
                    "Account Type",
                    "DropDownTextField",
                    ["Saving Account", "current Account"],
                    accountType,
                    (value) {
                      setState(() {
                        accountType = value!;
                      });
                    },
                  ],
                  [
                    "Account Table",
                    "DropDownTextField",
                    ["Account_history", "Current_state"],
                    accountTable,
                    (value) {
                      setState(() {
                        accountTable = value!;
                      });
                    },
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
                        ["Label", "Field Name"],
                        ["Label", "Display Name"],
                        ["Label", "Action"],
                      ],
                      [
                        ["Label", "AccountNumber"],
                        ["TextBox", yec],
                        [
                          "CheckBox",
                          checkBoxVal,
                          (value) {
                            setState(() {
                              checkBoxVal = value;
                            });
                          }
                        ]
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
