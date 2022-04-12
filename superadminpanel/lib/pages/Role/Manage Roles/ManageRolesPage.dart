import 'dart:html';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/utils/Utils.dart';
import 'package:superadminpanel/widgets/MainForm/ClickableList.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ManageRolesPage extends StatefulWidget {
  ManageRolesPage({Key? key}) : super(key: key);

  @override
  State<ManageRolesPage> createState() => _ManageRolesPageState();
}

class _ManageRolesPageState extends State<ManageRolesPage> {
  //form data
  TextEditingController roleNameTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  String roleType = "BANK_ADMIN";

// table data
  List<Map<String, dynamic>> data = [
    {
      "isExpanded": "+",
      "roleName": "24x7CallCenter",
      "roleDescription": "Call Center",
    },
    {
      "isExpanded": "+",
      "roleName": "24x7CallCenter",
      "roleDescription": "Call Center",
    },
    {
      "isExpanded": "+",
      "roleName": "24x7CallCenter",
      "roleDescription": "Call Center",
    },
  ];

  List<DatatableHeader> headers = [
    DatatableHeader(
        text: "",
        value: "isExpanded",
        show: true,
        sortable: false,
        flex: 1,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Role Name",
        value: "roleName",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Role Description",
        value: "roleDescription",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left),
  ];

    List<bool> selected = [];
  List<Color> selectedColors = [];
  List<List<dynamic>> selectedData = [];
  void initState() {
    window.document.onContextMenu.listen((evt) => evt.preventDefault());
    super.initState();

        setState(() {
      selectedColors = [Colors.grey[400]!, Colors.grey[400]!];
      selected = [false, false];
      selectedData = [
        [
          "ADMIN COMMON PRIVILEGES",
          0,
        ],
        [
          "ADMIN COMMON PRIVILEGES",
          1,
        ],
      ];
    });
  }

   

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [PageTitles.role, PageTitles.manageRoles],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                buttons: [
                  [
                    "Submit",
                    () => {print("1")},
                    AppColors.buttonLightGreenColor,
                    AppColors.white,
                  ],
                  [
                    "Reset",
                    () async {
                      await Utils.navigateTo(
                          context, RouteNames.editRoles, false);
                    },
                    AppColors.white,
                    Colors.black,
                    Colors.grey,
                  ],
                ],
                textFieldItems: [
                  [
                    "Role Name",
                    "TextField",
                    roleNameTextEditingController,
                  ],
                  [
                    "Description",
                    "TextField",
                    descriptionTextEditingController,
                  ],
                  [
                    "Role Type",
                    "DropDownTextField",
                    ["BANK_ADMIN", "CUSTOMER"],
                    roleType,
                    (value) {
                      setState(() {
                        roleType = value!;
                      });
                    },
                  ],
                  [
                    "",
                    "Custom",
                    ClickableList(selected:selected, selectedColors: selectedColors, selectedData: selectedData),
                  ],
                ],
                topic: 'Add User Role',
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
                removeCheckBox: true,
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
                      print(data["roleName"]);
                      // Navigator.pushNamed(context, RouteNames.editRoles)
                      // await Utils.navigateTo(context, RouteNames.editRoles, false);
                    }
                  ],
                ],
                rightClickable: true,
                title: Text(
                  "User Roles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                titleBackgroundColor: Colors.blue[100]!,
                searchKey: "Role Name",
                data: data,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

