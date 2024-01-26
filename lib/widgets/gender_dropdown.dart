import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final Function(String) onGenderSelected;

  GenderDropdown({required this.onGenderSelected});

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String currentSelected = "Male";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: currentSelected,
      onChanged: (String? newValue) {
        setState(() {
          currentSelected = newValue!;
          widget.onGenderSelected(newValue);
        });
      },
      items: <String>['Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: "Gender",
        border: OutlineInputBorder(),
      ),
    );
  }
}
