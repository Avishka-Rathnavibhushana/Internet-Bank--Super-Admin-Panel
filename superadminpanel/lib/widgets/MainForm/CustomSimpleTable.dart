import 'package:flutter/material.dart';

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
  //Item types
  //1) Label
  //2) TextLink
  //3) TextBox
  //3) CheckBox
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
                  border: Border.all(
                    width: 1,
                    color: widget.topicBackgroundColor!,
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
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1,
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
                                        child: Text(tableRow[1]),
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
