import 'package:flutter/material.dart';

class EntrySelectorCard extends StatelessWidget {
  EntrySelectorCard({super.key, required this.label, required this.iconPath});

  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFF93E4C1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              SizedBox(height: 50, width: 50, child: Image.asset(iconPath)),
              SizedBox(
                width: 10,
              ),
              Text(label),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }
}
