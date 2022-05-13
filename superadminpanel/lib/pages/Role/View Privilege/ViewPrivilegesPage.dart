import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/api/roleAndPrivilegesAPIs.dart';
import 'package:superadminpanel/modals/Privilege.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class ViewPrivilegesPagePage extends StatefulWidget {
  const ViewPrivilegesPagePage({Key? key}) : super(key: key);

  @override
  State<ViewPrivilegesPagePage> createState() => _ViewPrivilegesPagePageState();
}

class _ViewPrivilegesPagePageState extends State<ViewPrivilegesPagePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<List<List<dynamic>>> tableData = [];

  bool loading = false;

  Future<void> loadData() async {
    setState(() {
      loading = true;
    });
    List<Privilege> data = await RoleAndPrivilegesAPIs.findAllPrivilegeAPI();
    List<List<List<dynamic>>> tableDataTemp = [];
    for (Privilege item in data) {
      List<List<dynamic>> row = [
        ["Label", item.code, false, false],
        ["Label", item.name, false, false],
        ["Label", item.description, false, false],
        ["Label", item.type, false, false],
      ];
      setState(() {
        tableDataTemp.add(row);
      });
      debugPrint(tableDataTemp.toString());
    }
    setState(() {
      tableData = tableDataTemp;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [PageTitles.role, PageTitles.viewPrivileges],
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
                      isHeaderAvailable: false,
                      buttons: [],
                      textFieldItems: [
                        [
                          "",
                          "Table",
                          [
                            [
                              ["Label", "Code", false, true],
                              ["Label", "Name", false, true],
                              ["Label", "Description", false, true],
                              ["Label", "Type", false, true],
                            ],
                            ...tableData,
                          ],
                        ],
                      ],
                      topic: '',
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
