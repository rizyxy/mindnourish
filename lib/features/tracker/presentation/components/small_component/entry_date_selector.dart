import 'package:flutter/material.dart';

class EntryDateSelector extends StatelessWidget {
  const EntryDateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.calendar_month_outlined,
          size: 20,
          color: Color(0xFF2E4C66),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "TODAY, 17 MARCH 2024",
          style: TextStyle(color: Color(0xFF2E4C66), letterSpacing: 1),
        ),
      ],
    );
  }
}
