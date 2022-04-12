import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/Table/SimplifiedCustomResponsiveTable.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreateUserGroupLimitsPage extends StatefulWidget {
  CreateUserGroupLimitsPage({Key? key}) : super(key: key);

  @override
  State<CreateUserGroupLimitsPage> createState() =>
      _CreateUserGroupLimitsPageState();
}

class _CreateUserGroupLimitsPageState extends State<CreateUserGroupLimitsPage> {
  TextEditingController yec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: [
        PageTitles.setting,
        PageTitles.userGroupLimits,
        PageTitles.createUserGroupLimits
      ],
      body: CustomPageView(
        items: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Center(
              child: MainForm(
                isHeaderAvailable: false,
                buttons: [
                  [
                    "Update",
                    () => {print("1")},
                    AppColors.buttonLightGreenColor,
                    AppColors.white,
                  ],
                  [
                    "Reset",
                    () => {print("1")},
                    Colors.grey[700],
                    AppColors.white,
                  ],
                ],
                textFieldItems: [
                  ["", "Custom", TextLabel(text: "User Group: GOLD")],
                  [
                    "Admin Comment",
                    "Table",
                    [
                      [
                        ["Label", ""],
                        ["Label", "Daily Limit"],
                        ["Label", "Transaction Limit"],
                        ["Label", "OTP initiation Sealing Value"],
                      ],
                      [
                        ["Label", "Own account"],
                        ["TextBox", yec],
                        ["TextBox", yec],
                        ["Label", ""]
                      ],
                      [
                        ["Label", "3rd Party account within same bank"],
                        ["TextBox", yec],
                        ["TextBox", yec],
                        ["TextBox", yec]
                      ],
                      [
                        [
                          "Label",
                          "3rd part account other bank and bill payments"
                        ],
                        ["TextBox", yec],
                        ["TextBox", yec],
                        ["TextBox", yec]
                      ],
                      [
                        ["Label", "sPay anyone fund Transfers"],
                        ["TextBox", yec],
                        ["TextBox", yec],
                        ["Label", ""]
                      ],
                    ],
                  ],
                ],
                topic: 'User Status',
                topicBackgroundColor: Colors.blue[100],
                topicTextColor: Colors.blue[150],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextLabel extends StatelessWidget {
  var text;
  TextLabel({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class SimpleCustomTable extends StatefulWidget {
  final itemList;

  final Color? topicBackgroundColor;
  const SimpleCustomTable({
    Key? key,
    required this.topicBackgroundColor,
    required this.itemList,
  }) : super(key: key);

  @override
  State<SimpleCustomTable> createState() => _SimpleCustomTableState();
}

class _SimpleCustomTableState extends State<SimpleCustomTable> {
  Color buttonColor = Colors.blue;
  bool underlined = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.itemList
            .map(
              (tablColumn) => Row(
                children: [
                  ...tablColumn
                      .map(
                        (tableRow) => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget.topicBackgroundColor!,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: tableRow.length == 1
                                  ? Text(tableRow[0])
                                  : InkWell(
                                      onHover: (value) {
                                        if (value) {
                                          setState(() {
                                            buttonColor = Colors.blue[200]!;
                                            underlined = true;
                                          });
                                        } else {
                                          setState(() {
                                            buttonColor = Colors.blue;
                                            underlined = false;
                                          });
                                        }
                                      },
                                      onTap: tableRow[1],
                                      child: Text(
                                        tableRow[0],
                                        style: TextStyle(
                                            color: buttonColor,
                                            decoration: underlined
                                                ? TextDecoration.underline
                                                : TextDecoration.none),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}
