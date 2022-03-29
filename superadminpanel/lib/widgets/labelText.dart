import 'package:flutter/material.dart';

Widget LabelText({required String labelName, required bool isRequired}) {
  return Row(
    children: [
      Text(labelName),
      isRequired ? Text("*", style: TextStyle(color: Colors.red)) : Container(),
    ],
  );
}
