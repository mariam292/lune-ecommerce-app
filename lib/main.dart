import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';
=======
import 'package:nti_final_project/features/app_info/presentation/screens/privacy_screen.dart';
>>>>>>> origin/develop

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: Splash(),
=======
      home: PrivacyScreen(),
>>>>>>> origin/develop
    );
  }
}
