import 'package:superadminpanel/widgets/customText.dart';
import 'package:flutter/material.dart';

Widget TransactionSummaryTile(
    {required String id,
    required String amount,
    required String date,
    required bool isAdd}) {
  return Container(
    color: Colors.blue[100],
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isAdd ? Icon(Icons.add) : Icon(Icons.remove),
        Container(
          child: Column(
            children: [
              CustomText(text: id),
              CustomText(
                  text: "LKR " + amount,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
              CustomText(text: date),
            ],
          ),
        )
      ],
    ),
  );
}
