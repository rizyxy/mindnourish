import 'package:flutter/material.dart';

class WaterIndicator extends StatelessWidget {
  const WaterIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/water.png',
      opacity: AlwaysStoppedAnimation(0.7),
    );
  }
}
