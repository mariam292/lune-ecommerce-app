import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:nti_final_project/features/authentications/presentation/screens/otp_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/sign_up_screen.dart';
>>>>>>> origin/feature/malk
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
