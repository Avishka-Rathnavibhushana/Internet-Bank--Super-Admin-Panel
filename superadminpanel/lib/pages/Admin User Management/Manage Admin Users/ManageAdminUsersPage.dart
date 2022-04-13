import 'dart:html';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class MangeAdminUsersPage extends StatefulWidget {
  MangeAdminUsersPage({Key? key}) : super(key: key);

  @override
  State<MangeAdminUsersPage> createState() => _MangeAdminUsersPageState();
}

class _MangeAdminUsersPageState extends State<MangeAdminUsersPage> {
  //form data
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();
  String status = "- Select an option -";

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
    window.document.onContextMenu.listen((evt) => evt.preventDefault());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.adminUserManagement, PageTitles.manageAdminUsers],
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
                          () => {print("1")},
                          AppColors.buttonLightGreenColor,
                          AppColors.white,
                        ],
                        [
                          "Reset",
                          () => {print("2")},
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
                        ],
                        [
                          "First Name",
                          "TextField",
                          firstNameTextEditingController,
                          true,
                          false,
                        ],
                        [
                          "Emlpoyee Id",
                          "TextField",
                          employeeIdTextEditingController,
                          true,
                          false,
                        ],
                        [
                          "Status",
                          "DropDownTextField",
                          ["- Select an option -", "MR", "MRS", "MS"],
                          status,
                          false,
                          (value) {
                            setState(() {
                              status = value!;
                            });
                          },
                        ]
                      ],
                      topic: 'Filter',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
              ResponsiveRowColumnItem(
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
                        "Edit",
                        1,
                        (data) {
                          print(data["username"]);
                        }
                      ],
                      [
                        "Change Password",
                        2,
                        (data) {
                          print(data["title"]);
                        }
                      ],
                    ],
                    rightClickable: true,
                    title: Text(
                      "Admin Users",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    titleBackgroundColor: Colors.blue[100]!,
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
