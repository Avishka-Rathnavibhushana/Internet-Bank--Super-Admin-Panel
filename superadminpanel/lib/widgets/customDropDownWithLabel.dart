import 'package:flutter/material.dart';

Widget CustomDropDownWithLabel(
    {required List<String> dropDownValue,
    required String labelName,
    required bool isRequired,
    required String initialVal,
    required onChangedFun}) {
  return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(labelName),
          isRequired
              ? Text("*", style: TextStyle(color: Colors.red))
              : Container(),
        ],
      ),
      Container(
        child: DropdownButton<String>(
          value: initialVal,
          icon: Icon(Icons.arrow_drop_down_rounded),
          items: dropDownValue.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChangedFun,
        ),
      ),
    ],
  ));
}
