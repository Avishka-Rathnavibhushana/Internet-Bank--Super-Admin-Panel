import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final function;
  final bool isSelect;
  AppIconButton(
      {Key? key,
      required this.icon,
      required this.name,
      this.function,
      required this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(icon, color: isSelect ? Colors.blue : Colors.grey),
            Text(
              name,
              style: TextStyle(color: isSelect ? Colors.blue : Colors.grey),
            )
          ],
        ),
      ),
      onTap: function,
    );
  }
}
