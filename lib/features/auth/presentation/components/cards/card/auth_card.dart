import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.text, required this.selected});

  final String text;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: text == selected ? Color(0xFF93E4C1) : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(text),
    );
  }
}
