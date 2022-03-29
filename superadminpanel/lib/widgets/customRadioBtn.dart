import 'package:flutter/material.dart';

Widget CustomRadioBtn(
    {required List<String> btnNames,
    required List<String> toolTips,
    required int selectedValueIndex,
    required Function onChangedFn}) {
  int listLength = btnNames.length;
  int _value = selectedValueIndex;
  return Container(
    child: Column(
      children: <Widget>[
        for (int i = 0; i < listLength; i++)
          ListTile(
            title: Row(
              children: [
                Text(
                  '${btnNames[i]}',
                ),
                toolTips[i] == ""
                    ? Container()
                    : Tooltip(
                        message: '${toolTips[i]}',
                        child: Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Colors.teal,
                        ),
                      ),
              ],
            ),
            leading: Radio(
              value: i,
              groupValue: _value,
              onChanged: (int? value) {
                onChangedFn(value);
              },
            ),
          ),
      ],
    ),
  );
}
