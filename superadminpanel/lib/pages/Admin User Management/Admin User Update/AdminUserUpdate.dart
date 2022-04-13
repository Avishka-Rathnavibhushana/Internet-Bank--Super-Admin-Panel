import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class AdminUserUpdate extends StatefulWidget {
  AdminUserUpdate({Key? key}) : super(key: key);

  @override
  State<AdminUserUpdate> createState() => _AdminUserUpdateState();
}

class _AdminUserUpdateState extends State<AdminUserUpdate> {
  //form data
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  String status = "MR";
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController confirmEmailTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();

  // table data
  List<Map<String, dynamic>> data = [
    {
      "rolename": "24x7CallCenter",
      "description": "Call center",
    },
    {
      "rolename": "24x7CallCenter",
      "description": "Call center",
    },
    {
      "rolename": "24x7CallCenter",
      "description": "Call center",
    },
    {
      "rolename": "24x7CallCenter",
      "description": "Call center",
    },
  ];

  List<DatatableHeader> headers = [
    DatatableHeader(
        text: "Role Name",
        value: "rolename",
        show: true,
        sortable: false,
        flex: 1,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "description",
        show: true,
        sortable: false,
        flex: 2,
        textAlign: TextAlign.left),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppScaffold(
      pageTitle: [PageTitles.adminUserManagement, PageTitles.adminUserUpdate],
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
                        "Update",
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
                        "Status",
                        "DropDownTextField",
                        ["MR", "MRS", "MS"],
                        status,
                        true,
                        (value) {
                          setState(() {
                            status = value!;
                          });
                        },
                      ],
                      [
                        "First Name",
                        "TextField",
                        firstNameTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Last Name",
                        "TextField",
                        lastNameTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "E-mail",
                        "TextField",
                        emailTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Confirm E-mail",
                        "TextField",
                        confirmEmailTextEditingController,
                        true,
                        true,
                      ],
                      [
                        "Employee id",
                        "TextField",
                        employeeIdTextEditingController,
                        true,
                        true,
                      ],
                    ],
                    topic: 'Personal Details',
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
                rowFlex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SimplifiedCustomResponsiveTable(
                    footer: false,
                    removeCheckBox: false,
                    footerBackgroundColor: Colors.grey[300]!,
                    headerDecoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    headers: headers,
                    rightClickActions: [],
                    rightClickable: false,
                    title: Text(
                      "Role",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    titleBackgroundColor: Colors.blue[100]!,
                    searchKey: "description",
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
