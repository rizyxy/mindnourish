import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontWeight: FontWeight.w300),
      obscureText: _isObscure,
      validator: (value) {
        if (value == null || value == "") {
          return "${widget.label} cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          ),
          border: OutlineInputBorder(),
          isDense: true,
          labelText: widget.label),
    );
  }
}
