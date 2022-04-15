import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreateAdminUserPage extends StatefulWidget {
  CreateAdminUserPage({Key? key}) : super(key: key);

  @override
  State<CreateAdminUserPage> createState() => _CreateAdminUserPageState();
}

class _CreateAdminUserPageState extends State<CreateAdminUserPage> {
  //form 1 data
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  String status = "MR";
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController confirmEmailTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();

  //form 2 data
  String passwordPolicy = "Admin";
  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController reTypePasswordTextEditingController =
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
    return AppScaffold(
      pageTitle: [PageTitles.adminUserManagement, PageTitles.createAdminUser],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: CustomPageView(
            items: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
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
                  )),
              ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
                      textFieldItems: [
                        [
                          "Password Policy",
                          "DropDownTextField",
                          ["Admin", "Customer"],
                          passwordPolicy,
                          true,
                          (value) {
                            setState(() {
                              passwordPolicy = value!;
                            });
                          },
                        ],
                        [
                          "User Id",
                          "TextField",
                          userIdTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Password",
                          "TextField",
                          passwordTextEditingController,
                          true,
                          true,
                        ],
                        [
                          "Retype Password",
                          "TextField",
                          reTypePasswordTextEditingController,
                          true,
                          true,
                        ],
                      ],
                      topic: 'User Name and Password',
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