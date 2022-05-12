import 'dart:html';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/api/roleAndPrivilegesAPIs.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/modals/Role.dart';
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
  bool roleNameValidation = false;
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  bool descriptionValidation = false;
  String roleType = "BANK_ADMIN";

// table data
  List<Map<String, dynamic>> tableData = [];

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
        value: "name",
        show: true,
        sortable: true,
        flex: 10,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Role Description",
        value: "description",
        show: true,
        sortable: true,
        flex: 10,
        textAlign: TextAlign.left),
  ];

  List<bool> selected = [];
  List<Color> selectedColors = [];
  List<List<dynamic>> selectedData = [];
  void initState() {
    document.onContextMenu.listen((evt) => evt.preventDefault());
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
    loadData();
  }

  bool loading = false;

  Future<void> loadData() async {
    setState(() {
      loading = true;
    });
    List<Role> data = await RoleAndPrivilegesAPIs.findAllRoleAPI();
    List<Map<String, dynamic>> jsonData = data
        .map(
          (Role item) => item.toJson(),
        )
        .toList();
    setState(() {
      tableData = jsonData;
    });
    setState(() {
      loading = false;
    });
  }

  void submit() async {
    setState(() {
      loading = true;
    });
    String role = roleNameTextEditingController.text;
    String description = descriptionTextEditingController.text;
    String roleTypeTemp = roleType;

    if (role == "" || description == "") {
      if (role == "") {
        setState(() {
          roleNameValidation = true;
        });
      } else {
        setState(() {
          roleNameValidation = false;
        });
      }

      if (description == "") {
        setState(() {
          descriptionValidation = true;
        });
      } else {
        setState(() {
          descriptionValidation = false;
        });
      }
      print("Check required fields");
    } else {
      Role roleModal = Role(
        description: description,
        name: role,
        objectuuid: "",
        roletype: roleTypeTemp,
        isExpanded: "",
      );
      bool data = await RoleAndPrivilegesAPIs.createRoleAPI(roleModal);
      print(data);
      reset();
      await loadData();
    }

    setState(() {
      loading = false;
    });
  }

  void reset() {
    setState(() {
      roleNameTextEditingController.text = "";
      descriptionTextEditingController.text = "";
      roleType = "BANK_ADMIN";
    });
    setState(() {
      roleNameValidation = false;
      descriptionValidation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [PageTitles.role, PageTitles.manageRoles],
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomPageView(
              items: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [
                        [
                          "Submit",
                          submit,
                          AppColors.buttonLightGreenColor,
                          AppColors.white,
                        ],
                        [
                          "Reset",
                          reset,
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
                          true,
                          false,
                          roleNameValidation,
                        ],
                        [
                          "Description",
                          "TextField",
                          descriptionTextEditingController,
                          true,
                          false,
                          descriptionValidation,
                        ],
                        [
                          "Role Type",
                          "DropDownTextField",
                          ["BANK_ADMIN", "CUSTOMER"],
                          roleType,
                          false,
                          (value) {
                            setState(() {
                              roleType = value!;
                            });
                          },
                        ],
                        [
                          "",
                          "Custom",
                          ClickableList(
                              selected: selected,
                              selectedColors: selectedColors,
                              selectedData: selectedData),
                        ],
                      ],
                      topic: 'Add User Role',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  ),
                ),
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
                      footer: true,
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
                          (data) async {
                            await Utils.navigateTo(
                                context, RouteNames.manageRoles, false);
                            await Utils.navigateTo(
                                context, RouteNames.editRoles, false);
                          }
                        ],
                      ],
                      rightClickable: true,
                      title: const Text(
                        "User Roles",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      titleBackgroundColor: Colors.blue[700]!,
                      searchKey: "name",
                      data: tableData,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
