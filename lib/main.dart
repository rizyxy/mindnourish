import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/views/splash_page.dart';

void main() {
  runApp(MindNourish());
}

class MindNourish extends StatelessWidget {
  const MindNourish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}
