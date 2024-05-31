import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:mindnourish/features/auth/presentation/views/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MindNourish());
}

class MindNourish extends StatelessWidget {
  const MindNourish({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterController())
      ],
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
