import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  const NumberField(
      {super.key,
      required this.label,
      required this.suffix,
      required this.controller});

  final String label;
  final String suffix;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            suffixText: suffix,
            border: InputBorder.none,
            isDense: true,
            hintText: label),
      ),
    );
  }
}
