import 'package:flutter/material.dart';
import 'package:superadminpanel/widgets/MainForm/ClickableContainer.dart';

class ClickableList extends StatefulWidget {
  List<bool> selected = [];
  List<Color> selectedColors = [];
  List<List<dynamic>> selectedData = [];
  ClickableList(
      {Key? key,
      required this.selected,
      required this.selectedColors,
      required this.selectedData})
      : super(key: key);

  @override
  State<ClickableList> createState() => _ClickableListState();
}

class _ClickableListState extends State<ClickableList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.selectedData.map((item) {
          return Column(
            children: [
              ClickableContainer(
                text: item[0],
                selected: widget.selected[item[1]],
                onTap: () {
                  setState(() {
                    widget.selected[item[1]] = !widget.selected[item[1]];
                    if (widget.selected[item[1]]) {
                      widget.selectedColors[item[1]] = Colors.grey[600]!;
                    } else {
                      widget.selectedColors[item[1]] = Colors.grey[400]!;
                    }
                  });

                },
                selectedColor: widget.selectedColors[item[1]],
              ),
              const Divider(
                color: Colors.white,
                height: 1,
              ),
            ],
          );
        })
      ],
    );
  }
}
