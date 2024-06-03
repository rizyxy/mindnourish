import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:mindnourish/features/auth/presentation/views/splash_page.dart';
import 'package:mindnourish/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
