// ignore: file_names
import 'package:flutter/material.dart';

class AppDropdownInput<String> extends StatelessWidget {
  final List<String> options;
  final String value;
  final void Function(String?) onChanged;

  // ignore: use_key_in_widget_constructors
  const AppDropdownInput({
    this.options = const [],
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 13,
              horizontal: 10,
            ),
            border: OutlineInputBorder(),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
