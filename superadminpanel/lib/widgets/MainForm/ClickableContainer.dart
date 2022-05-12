import 'package:flutter/material.dart';

class ClickableContainer extends StatefulWidget {
  final String text;
  final bool selected;
  final onTap;
  final Color selectedColor;
  const ClickableContainer({
    Key? key,
    required this.text,
    required this.selected,
    this.onTap,
    required this.selectedColor,
  }) : super(key: key);

  @override
  State<ClickableContainer> createState() => _ClickableContainerState();
}

class _ClickableContainerState extends State<ClickableContainer> {
  Color hoverColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        if (value) {
          setState(() {
            hoverColor = Colors.grey[400]!;
          });
        } else {
          setState(() {
            hoverColor = Colors.grey;
          });
        }
      },
      onTap: widget.onTap,
      child: Container(
        height: 30,
        color: widget.selected ? widget.selectedColor : hoverColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20,
              color: Colors.white.withOpacity(0.5),
            ),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
