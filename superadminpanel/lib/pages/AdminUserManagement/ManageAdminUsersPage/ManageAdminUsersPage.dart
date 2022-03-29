import 'package:superadminpanel/widgets/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class MangeAdminUsersPage extends StatefulWidget {
  MangeAdminUsersPage({Key? key}) : super(key: key);

  @override
  State<MangeAdminUsersPage> createState() => _MangeAdminUsersPageState();
}

class _MangeAdminUsersPageState extends State<MangeAdminUsersPage> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController employeeIdTextEditingController =
      TextEditingController();
  String status = "- Select an option -";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.manageAdminUsers,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: MainForm(
                    buttons: [
                      [
                        "Search",
                        () => {print("1")},
                        Colors.green[200],
                        Colors.white,
                      ],
                      [
                        "Reset",
                        () => {print("2")},
                        Colors.grey[700],
                        Colors.white,
                      ]
                    ],
                    textFieldItems: [
                      [
                        "User Name",
                        "TextField",
                        userNameTextEditingController,
                      ],
                      [
                        "First Name",
                        "TextField",
                        firstNameTextEditingController,
                      ],
                      [
                        "Emlpoyee Id",
                        "TextField",
                        employeeIdTextEditingController,
                      ],
                      [
                        "Status",
                        "DropDownTextField",
                        ["- Select an option -", "MR", "MRS", "MS"],
                        status,
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
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.white,
                    child: Text("Table"),
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
