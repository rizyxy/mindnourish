import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalField extends StatelessWidget {
  const NormalField({super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.w300),
      validator: (value) {
        if (value == null || value == "") {
          return "$label cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(), isDense: true, labelText: label),
    );
  }
}
