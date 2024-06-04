import 'package:flutter/material.dart';

class WaterIndicator extends StatelessWidget {
  const WaterIndicator(
      {super.key, required this.litre, required this.indicator});

  final double litre;
  final double indicator;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/water.png',
      opacity: AlwaysStoppedAnimation(litre >= indicator ? 1 : 0.6),
    );
  }
}
