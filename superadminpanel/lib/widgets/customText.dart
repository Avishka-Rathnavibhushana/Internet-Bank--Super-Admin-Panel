import 'package:flutter/material.dart';

Widget CustomText(
    {required String text,
    double fontSize = 15,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize == null ? 15 : fontSize,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
  );
}
