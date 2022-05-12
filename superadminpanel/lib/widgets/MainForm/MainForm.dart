import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/Colors.dart';
import 'package:superadminpanel/widgets/MainForm/CustomSimpleTable.dart';

import 'AppDropdownInput.dart';

class MainForm extends StatelessWidget {
  var isHeaderAvailable;

  MainForm({
    Key? key,
    required this.buttons,
    required this.textFieldItems,
    required this.topic,
    required this.topicBackgroundColor,
    required this.topicTextColor,
    this.isHeaderAvailable = true,
  }) : super(key: key);

  var buttons = [];
  var textFieldItems = [];
  // textFieldItems types
  // 1) TextField - [[0]Label Name:String, [1]Type:String="TextField", [2]controller:TextEditingController,true, [3]enabled:bool, [4]isRequired:bool]
  // 2) DropDownTextField - [[0]Label Name:String, [1]Type:String="DropDownTextField", [2]options:List<dynamic>, [3]value:dynamic, [4]isRequired:bool, [5]onchanged:Function(dynamic)]
  // 3) LabelField
  // 4) CkeckBoxField
  // 5) Radio
  // 6) TextArea - [[0]Label Name:String, [1]Type:String="TextArea", [2]controller:TextEditingController,true, [3]maxLines:int, [4]isRequired:bool, [5]enabled:bool]
  // 7) Table
  // 8) Custom
  String topic = "";
  Color? topicBackgroundColor = AppColors.white;
  Color? topicTextColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(bottom: buttons.length == 0 ? 0 : 20),
        decoration: BoxDecoration(
          color: AppColors.white,
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
            isHeaderAvailable
                ? Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding:
                            const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                        child: Text(
                          topic,
                          style: TextStyle(
                            color: topicTextColor,
                          ),
                        ),
                        color: topicBackgroundColor,
                      )),
                    ],
                  )
                : Container(),
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
                      (item[1] == "TextField" ||
                              item[1] == "DropDownTextField" ||
                                  item[1] == "TextArea") &&
                              item[0] != ""
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, top: 10),
                              child: Row(
                                children: [
                                  Text(item[0]),
                                  item[4]
                                      ? const Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ):Container(),
                                ],
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                            ),
                      item[1] == "TextField"
                          ? Container(
                              padding: const EdgeInsets.only(bottom: 8, top: 3),
                              child: TextField(
                                controller: item[2],
                                maxLines: 1,
                                obscureText: item.length >= 7 ? item[6] : false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  errorText: item[5]
                                      ? item.length >= 8
                                          ? item[7]
                                          : 'Field cannot be empty.'
                                      : null,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 13,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  enabled: item[3],
                                  fillColor:
                                      item[3] ? Colors.white : Colors.grey[300],
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            )
                          : item[1] == "DropDownTextField"
                              ? AppDropdownInput(
                                  options: item[2],
                                  value: item[3],
                                  onChanged: item[5])
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
                                                controller: item[2],
                                                maxLines: item[3],
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  errorText: item[6]
                                                      ? 'Field cannot be empty.'
                                                      : null,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 13,
                                                    horizontal: 10,
                                                  ),
                                                  filled: true,
                                                  enabled: item[5],
                                                  fillColor: item[5]
                                                      ? Colors.white
                                                      : Colors.grey[300],
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            )
                                          : item[1] == "Table"
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8, top: 3),
                                                  child: SimpleCustomTable(
                                                    topicBackgroundColor:
                                                        topicBackgroundColor,
                                                    itemList: item[2],
                                                    borderType: item.length == 4
                                                        ? item[3]
                                                        : 2,
                                                  ),
                                                )
                                              : item[1] == "Custom"
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8,
                                                              top: 3),
                                                      child: item[2],
                                                    )
                                                  : item[1] == "Radio"
                                                      ? Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 3,
                                                                  top: 3),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ...item[2].map(
                                                                  (radioButtonItem) {
                                                                return Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Radio(
                                                                        value:
                                                                            radioButtonItem[0],
                                                                        onChanged:
                                                                            radioButtonItem[2],
                                                                        groupValue:
                                                                            radioButtonItem[1],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        radioButtonItem[
                                                                            0],
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }).toList(),
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
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: item.length == 5 ? item[4] : item[2],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: item[2],
                              splashColor: AppColors.black12,
                              onPressed: item[1],
                              child: Text(
                                item[0],
                                style: TextStyle(
                                  color: item[3],
                                ),
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
