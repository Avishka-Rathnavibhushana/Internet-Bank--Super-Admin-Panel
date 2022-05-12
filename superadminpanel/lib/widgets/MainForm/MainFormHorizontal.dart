import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/constants/Colors.dart';

// ignore: must_be_immutable
class MainFormHorizontal extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var isHeaderAvailable;

  MainFormHorizontal({
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
  // 1) TextField - [[0]Label Name:String, [1]Type:String="TextField", [2]controller:TextEditingController, [3 - optional]enabled:bool]
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.end,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ...textFieldItems.map((item) {
                    return ResponsiveRowColumnItem(
                      rowFit: FlexFit.loose,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(item[0]),
                          ),
                          item[1] == "TextField"
                              ? Container(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 3),
                                  child: TextField(
                                    controller: item[2],
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabled:
                                          item.length == 4 ? item[3] : true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal: 10,
                                      ),
                                      filled: true,
                                      fillColor: item.length == 4 && !item[3]
                                          ? Colors.grey[300]
                                          : Colors.white,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  }).toList(),
                  ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: buttons
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: item.length == 5
                                            ? item[4]
                                            : item[2],
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
