import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

Widget CustomDatePickerWidget() {
  return Container(
    padding: EdgeInsets.only(top: 5),
    child: DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'yyyy/MM/dd',
      use24HourFormat: false,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365, hours: 23)),
      decoration: InputDecoration(
        // border: InputBorder.none,
        hintText: 'Date',
        // filled: true,
        prefixIcon: Icon(
          Icons.event,
          color: Color.fromARGB(179, 37, 37, 37),
        ),
      ),
      dateLabelText: 'Date',
      timeLabelText: "Time",
      onChanged: (val) {
        DateTime dt = DateTime.parse(val);
        // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(val);
      },
      validator: (val) {
        return null;
      },
      onSaved: (val) => debugPrint(val),
    ),
  );
}
