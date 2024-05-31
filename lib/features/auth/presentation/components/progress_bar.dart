import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.progress});

  final int progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: progress >= 1 ? Colors.green : Colors.grey.shade400,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          color: progress >= 2 ? Colors.green : Colors.grey.shade400,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          color: progress >= 3 ? Colors.green : Colors.grey.shade400,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          color: progress >= 4 ? Colors.green : Colors.grey.shade400,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          color: progress >= 5 ? Colors.green : Colors.grey.shade400,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
      ],
    );
  }
}
