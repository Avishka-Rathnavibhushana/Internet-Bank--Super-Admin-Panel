import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/colors.dart';

class CustomLabelContainer extends StatelessWidget {
  final String text;

  const CustomLabelContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.primaryColorDark,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
