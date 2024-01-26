import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function(String) validator;
  final Function(String) onSaved;
  final bool isMultiline;

  CustomTextField({
    required this.label,
    required this.validator,
    required this.onSaved,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) => validator(value ?? ''),
      onSaved: (value) => onSaved(value ?? ''),
      keyboardType: isMultiline ? TextInputType.multiline : TextInputType.text,
      maxLines: isMultiline ? null : 1,
    );
  }
}
