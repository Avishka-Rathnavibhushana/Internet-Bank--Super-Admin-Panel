import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/utils/Utils.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'dart:html';

import '../../../constants/PageTitles.dart';

class AdminUserApprovalQueuePage extends StatefulWidget {
  const AdminUserApprovalQueuePage({Key? key}) : super(key: key);

  @override
  State<AdminUserApprovalQueuePage> createState() =>
      _AdminUserApprovalQueuePageState();
}

class _AdminUserApprovalQueuePageState
    extends State<AdminUserApprovalQueuePage> {
  //form data
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();

  // table data
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
    }
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
    DatatableHeader(
        text: "First Name",
        value: "firstname",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Last Name",
        value: "lastname",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
  ];

  @override
  void initState() {
    document.onContextMenu.listen((evt) => evt.preventDefault());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [
        PageTitles.adminUserManagement,
        PageTitles.adminUserApprovalQueue
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: CustomPageView(
            items: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [
                        [
                          "Search",
                          () => {debugPrint("1")},
                          AppColors.buttonLightGreenColor,
                          AppColors.white,
                        ],
                        [
                          "Reset",
                          () => {debugPrint("2")},
                          Colors.grey[700],
                          AppColors.white,
                        ]
                      ],
                      textFieldItems: [
                        [
                          "User Name",
                          "TextField",
                          userNameTextEditingController,
                          true,
                          false,
                          false, // validation
                        ],
                        [
                          "First Name",
                          "TextField",
                          firstNameTextEditingController,
                          true,
                          false,
                          false, // validation
                        ],
                        [
                          "Emlpoyee Id",
                          "TextField",
                          employeeIdTextEditingController,
                          true,
                          false,
                          false, // validation
                        ],
                      ],
                      topic: 'Filter',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
              const ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SimplifiedCustomResponsiveTable(
                    footerBackgroundColor: Colors.grey[300]!,
                    headerDecoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    headers: headers,
                    rightClickActions: [
                      [
                        "Approve",
                        1,
                        (data) async {
                          await Utils.navigateTo(context,
                              RouteNames.adminUserApprovalQueue, false);
                          await Utils.navigateTo(
                              context, RouteNames.adminUserApproval, false);
                        }
                      ],
                    ],
                    rightClickable: true,
                    title: const Text(
                      "Admin Users",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    titleBackgroundColor: Colors.blue[700]!,
                    searchKey: "id",
                    data: data,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
