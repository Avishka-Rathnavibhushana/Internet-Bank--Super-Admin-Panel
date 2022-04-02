import 'package:flutter/material.dart';
import 'package:superadminpanel/widgets/AppDropdownInput.dart';

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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 10),
                        child: Text(item[0]),
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
                          : AppDropdownInput(
                              options: item[2],
                              value: item[3],
                              onChanged: item[4]),
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
