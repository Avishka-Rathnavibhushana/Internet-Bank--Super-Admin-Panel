import 'dart:ui';

import 'package:flutter/material.dart';

import 'AppDropdownInput.dart';

class MainForm extends StatelessWidget {
  MainForm({
    Key? key,
    required this.buttons,
    required this.textFieldItems,
    required this.topic,
    required this.topicBackgroundColor,
    required this.topicTextColor,
  }) : super(key: key);

  var buttons = [];
  var textFieldItems = [];
  // textFieldItems types
  // 1) TextField
  // 2) DropDownTextField
  // 3) LabelField
  // 4) CkeckBoxField
  // 5) TextArea
  // 6) Table
  String topic = "";
  Color? topicBackgroundColor = Colors.white;
  Color? topicTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: topicBackgroundColor!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                  child: Text(
                    topic,
                    style: TextStyle(
                      color: topicTextColor,
                    ),
                  ),
                  color: topicBackgroundColor,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: textFieldItems.map((item) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      item[1] == "TextField" ||
                              item[1] == "DropDownTextField" ||
                              item[1] == "TextArea"
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, top: 10),
                              child: Text(item[0]),
                            )
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                            ),
                      item[1] == "TextField"
                          ? Container(
                              padding: const EdgeInsets.only(bottom: 8, top: 3),
                              child: TextField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 13,
                                    horizontal: 10,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          : item[1] == "DropDownTextField"
                              ? AppDropdownInput(
                                  options: item[2],
                                  value: item[3],
                                  onChanged: item[4])
                              : item[1] == "LabelField"
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 3, top: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            item[0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            item[2],
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    )
                                  : item[1] == "CkeckBoxField"
                                      ? Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 3, top: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Checkbox(
                                                  value: item[2],
                                                  onChanged: item[3]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                item[0],
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        )
                                      : item[1] == "TextArea"
                                          ? Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8, top: 3),
                                              child: TextField(
                                                maxLines: item[3],
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 13,
                                                    horizontal: 10,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            )
                                          : item[1] == "Table"
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8, top: 3),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ...item[2]
                                                          .map(
                                                            (tablColumn) => Row(
                                                              children: [
                                                                ...tablColumn
                                                                    .map(
                                                                      (tableRow) =>
                                                                          Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              width: 1,
                                                                              color: topicBackgroundColor!,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(5),
                                                                            child:
                                                                                Text(tableRow),
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
                                                  ),
                                                )
                                              : Container(),
                    ],
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Wrap(
                runSpacing: 10,
                children: buttons
                    .map((item) => new Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: item[2],
                            splashColor: Colors.black12,
                            onPressed: item[1],
                            child: Text(
                              item[0],
                              style: TextStyle(
                                color: item[3],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
