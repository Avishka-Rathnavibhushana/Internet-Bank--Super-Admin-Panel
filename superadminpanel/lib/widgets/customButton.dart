import 'package:flutter/material.dart';

Widget CustomButton(
    {required String buttonName,
    required function,
    Color textColor = Colors.white,
    required Color buttonColor}) {
  return RaisedButton(
    onPressed: function,
    color: buttonColor == null ? Colors.grey : buttonColor,
    child: Text(buttonName,
        style: TextStyle(color: textColor == null ? Colors.white : textColor)),
  );
}
