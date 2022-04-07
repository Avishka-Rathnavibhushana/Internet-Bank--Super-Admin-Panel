import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomPageView extends StatelessWidget {
  final List<ResponsiveRowColumnItem> items;
  const CustomPageView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ResponsiveRowColumn(
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: items,
        ),
      ),
    );
  }
}
