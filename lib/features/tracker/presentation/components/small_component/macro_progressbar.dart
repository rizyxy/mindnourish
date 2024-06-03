import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MacroProgressBar extends StatelessWidget {
  MacroProgressBar(
      {super.key, required this.macroName, required this.macroGoal});

  final String macroName;
  final double macroGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          macroName,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 10,
        ),
        LinearPercentIndicator(
          lineHeight: 3,
          backgroundColor: Colors.grey.shade300,
        ),
        SizedBox(
          height: 10,
        ),
        Text("0 / ${macroGoal.toString()}g", style: TextStyle(fontSize: 12))
      ],
    );
  }
}
