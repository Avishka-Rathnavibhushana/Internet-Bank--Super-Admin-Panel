import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/api/roleAndPrivilegesAPIs.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/modals/Privilege.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/CreateUserGroupLimitsPage.dart';
import 'package:superadminpanel/widgets/CustomLabelContainer.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreatePrivilagePage extends StatefulWidget {
  CreatePrivilagePage({Key? key}) : super(key: key);

  @override
  State<CreatePrivilagePage> createState() => _CreatePrivilagePageState();
}

class _CreatePrivilagePageState extends State<CreatePrivilagePage> {
  TextEditingController privilegeNameTextEditingController =
      TextEditingController();
  bool privilegeNameValidate = false;
  TextEditingController codeTextEditingController = TextEditingController();
  bool codeValidate = false;
  TextEditingController descriptionTextEditingController =
      TextEditingController();
      bool descriptionValidate = false;

  String category = "BANKING USER MANAGEMENT";
  String type = "BANK_ADMIN";

  bool loading = false;

  void submit() async {
    setState(() {
      loading = true;
    });
    String name = privilegeNameTextEditingController.text;
    String code = codeTextEditingController.text;
    String description = descriptionTextEditingController.text;
    String categoryName = category;
    String typeName = type;

    if (name == "" || code == "" || description == "") {
      if (name == "") {
        setState(() {
          privilegeNameValidate = true;
        });
      }else{
        setState(() {
          privilegeNameValidate = false;
        });
      }
      if (code == "") {
        setState(() {
          codeValidate = true;
        });
      } else {
        setState(() {
          codeValidate = false;
        });
      }
      if (description == "") {
        setState(() {
          descriptionValidate = true;
        });
      } else {
        setState(() {
          descriptionValidate = false;
        });
      }
      print("Check required fields");
    } else {
      setState(() {
        privilegeNameValidate = false;
        codeValidate = false;
        descriptionValidate = false;
      });
      Privilege privilege = Privilege.fromJson({
        "category": categoryName,
        "code": code,
        "description": description,
        "name": name,
        "objectuuid": null,
        "type": typeName
      });
      bool data = await RoleAndPrivilegesAPIs.createPrivilegeAPI(privilege);
      reset();
    }
    
    setState(() {
      loading = false;
    });
  }

  void reset() {
    setState(() {
      privilegeNameTextEditingController.text = "";
      codeTextEditingController.text = "";
      descriptionTextEditingController.text = "";
      category = "BANKING USER MANAGEMENT";
      type = "BANK_ADMIN";
    });
    setState(() {
      privilegeNameValidate = false;
      codeValidate = false;
      descriptionValidate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [PageTitles.role, PageTitles.createPrivileges],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabelContainer(text: "Create New Privilages"),
                Center(
                  child: loading
                      ? const Center(child: CircularProgressIndicator())
                      : MainForm(
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
                              "Privilege Name",
                              "TextField",
                              privilegeNameTextEditingController,
                              true,
                              true,
                              privilegeNameValidate,
                              false, // validation
                            ],
                            [
                              "Code",
                              "TextField",
                              codeTextEditingController,
                              true,
                              true,
                              codeValidate,
                              false, // validation
                            ],
                            [
                              "Description",
                              "TextArea",
                              descriptionTextEditingController,
                              3,
                              true,
                              true,
                              descriptionValidate,
                            ],
                            [
                              "Category",
                              "DropDownTextField",
                              ["BANKING USER MANAGEMENT", "BANKING CUSTOMER"],
                              category,
                              false,
                              (value) {
                                setState(() {
                                  category = value!;
                                });
                              },
                            ],
                            [
                              "type",
                              "DropDownTextField",
                              ["BANK_ADMIN", "BANK_USER"],
                              type,
                              false,
                              (value) {
                                setState(() {
                                  type = value!;
                                });
                              },
                            ],
                          ],
                          topic: '',
                          isHeaderAvailable: false,
                          topicBackgroundColor: Colors.blue[100],
                          topicTextColor: Colors.blue[150],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
