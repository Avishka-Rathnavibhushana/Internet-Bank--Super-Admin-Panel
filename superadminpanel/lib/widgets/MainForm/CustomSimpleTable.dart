import 'package:flutter/material.dart';

class SimpleCustomTable extends StatefulWidget {
  final itemList;
  final int borderType;

  final Color? topicBackgroundColor;
  const SimpleCustomTable({
    Key? key,
    required this.topicBackgroundColor,
    required this.itemList,
    required this.borderType,
  }) : super(key: key);

  @override
  State<SimpleCustomTable> createState() => _SimpleCustomTableState();
}

class _SimpleCustomTableState extends State<SimpleCustomTable> {
  //Item types
  //1) Label
  //2) TextLink
  //3) TextBox
  //4) CheckBox
  //5) Button
  //6) Icon
  //7) Custom

  //Border Types
  //0 -  No Border
  //1 -  Only Bottom Border
  //2 -  Complete Border
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
              (tablColumn) => Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      style: widget.borderType >= 2
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: widget.topicBackgroundColor!,
                    ),
                    right: BorderSide(
                      width: 1,
                      style: widget.borderType >= 2
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: widget.topicBackgroundColor!,
                    ),
                    top: BorderSide(
                      width: 1,
                      style: widget.borderType >= 2
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: widget.topicBackgroundColor!,
                    ),
                    bottom: BorderSide(
                      width: 1,
                      style: widget.borderType >= 1
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: widget.topicBackgroundColor!,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...tablColumn
                        .map(
                          (tableRow) => Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                right: tableRow[0] != "Label"
                                    ? 0
                                    : tableRow.length == 2
                                        ? 0
                                        : tableRow[2]
                                            ? 10
                                            : 0,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1,
                                    style: widget.borderType >= 2
                                        ? BorderStyle.solid
                                        : BorderStyle.none,
                                    color: widget.topicBackgroundColor!,
                                  ),
                                  bottom: BorderSide(
                                    width: 1,
                                    style: tableRow[0] != "Label"
                                        ? BorderStyle.none
                                        : tableRow.length == 2
                                            ? BorderStyle.none
                                            : tableRow[2]
                                                ? BorderStyle.solid
                                                : BorderStyle.none,
                                    color: widget.topicBackgroundColor!,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: tableRow[0] == "Label"
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6.5),
                                        child: Text(
                                          tableRow[1],
                                        ),
                                      )
                                    : tableRow[0] == "TextLink"
                                        ? InkWell(
                                            onHover: (value) {
                                              if (value) {
                                                setState(() {
                                                  buttonColor =
                                                      Colors.blue[200]!;
                                                  underlined = true;
                                                });
                                              } else {
                                                setState(() {
                                                  buttonColor = Colors.blue;
                                                  underlined = false;
                                                });
                                              }
                                            },
                                            onTap: tableRow[2],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6.5),
                                              child: Text(
                                                tableRow[1],
                                                style: TextStyle(
                                                    color: buttonColor,
                                                    decoration: underlined
                                                        ? TextDecoration
                                                            .underline
                                                        : TextDecoration.none),
                                              ),
                                            ),
                                          )
                                        : tableRow[0] == "TextBox"
                                            ? TextField(
                                                controller: tableRow[1],
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 9,
                                                    horizontal: 10,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                ),
                                              )
                                            : tableRow[0] == "CheckBox"
                                                ? Checkbox(
                                                    value: tableRow[1],
                                                    onChanged: tableRow[2])
                                                : tableRow[0] == "Radio"
                                                    ? Radio(
                                                        value: tableRow[1],
                                                        onChanged: tableRow[2],
                                                        groupValue: tableRow[3],
                                                      )
                                                    : tableRow[0] == "Button"
                                                        ? ElevatedButton(
                                                            child: Text(
                                                                tableRow[1]),
                                                            onPressed:
                                                                tableRow[2],
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        tableRow[
                                                                            3],
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color:
                                                                          tableRow[
                                                                              4],
                                                                    )),
                                                          )
                                                        : tableRow[0] == "Icon"
                                                            ? Icon(
                                                                Icons
                                                                    .trending_up,
                                                                color: Colors
                                                                    .green[500],
                                                              )
                                                            : tableRow[0] ==
                                                                    "Custom"
                                                                ? tableRow[1]
                                                                : Container(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
