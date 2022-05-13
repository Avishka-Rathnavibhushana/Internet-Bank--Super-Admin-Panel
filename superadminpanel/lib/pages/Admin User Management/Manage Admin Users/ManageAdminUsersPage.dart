import 'dart:html';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/api/adminUserManagementAPIs.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/modals/AdminUser.dart';
import 'package:superadminpanel/utils/Utils.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class MangeAdminUsersPage extends StatefulWidget {
  const MangeAdminUsersPage({Key? key}) : super(key: key);

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
  List<Map<String, dynamic>> tableData = [];

  List<DatatableHeader> headers = [
    DatatableHeader(
        text: "User Name",
        value: "userid",
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
        value: "status",
        show: true,
        sortable: true,
        flex: 1,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "First Name",
        value: "fname",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Last Name",
        value: "lname",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
  ];

  String searchValue = "";
  String searchKey = "userid";

  @override
  void initState() {
    document.onContextMenu.listen((evt) => evt.preventDefault());
    super.initState();
    loadData();
  }

  bool loading = false;

  Future<void> loadData() async {
    setState(() {
      loading = true;
    });
    List<AdminUser> data = await AdminUserManagementAPIS.findAllAdminAPI();
    List<Map<String, dynamic>> jsonData = data
        .map(
          (AdminUser item) => item.toJson(),
        )
        .toList();
    setState(() {
      tableData = jsonData;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [PageTitles.adminUserManagement, PageTitles.manageAdminUsers],
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: CustomPageView(
                  items: [
                    ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Center(
                          child: MainForm(
                            buttons: [
                              [
                                "Search",
                                () {
                                  setState(() {
                                    if (userNameTextEditingController.text !=
                                        "") {
                                      searchKey = "userid";
                                      searchValue =
                                          userNameTextEditingController.text;
                                    } else if (firstNameTextEditingController
                                            .text !=
                                        "") {
                                      searchKey = "fname";
                                      searchValue =
                                          firstNameTextEditingController.text;
                                    } else if (employeeIdTextEditingController
                                            .text !=
                                        "") {
                                     
                                      searchKey = "employeeid";
                                      searchValue =
                                          employeeIdTextEditingController.text;
                                    } else if (status !=
                                        "- Select an option -") {
                                      searchKey = "status";
                                      searchValue = status;
                                    }
                                  });
                                },
                                AppColors.buttonLightGreenColor,
                                AppColors.white,
                              ],
                              [
                                "Reset",
                                () {
                                  debugPrint("2");
                                  setState(() {
                                    userNameTextEditingController.text = "";
                                    firstNameTextEditingController.text = "";
                                    employeeIdTextEditingController.text = "";
                                    status = "- Select an option -";
                                    searchKey = "userid";
                                    searchValue = "";
                                  });
                                },
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
                          searchValue: searchValue,
                          searchKey: searchKey,
                          footerBackgroundColor: Colors.grey[300]!,
                          headerDecoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          headers: headers,
                          rightClickActions: [
                            [
                              "Edit",
                              1,
                              (data) async {
                                await Utils.navigateTo(context,
                                    RouteNames.manageAdminUsers, false);
                                await Utils.navigateTo(
                                    context, RouteNames.adminUserUpdate, false);
                              }
                            ],
                            [
                              "Change Password",
                              2,
                              (data) async {
                                await Utils.navigateTo(context,
                                    RouteNames.manageAdminUsers, false);
                                await Utils.navigateTo(context,
                                    RouteNames.manageBankingUsers, false);
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
                          data: tableData,
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
