import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'features/authentications/presentation/screens/login_screen.dart';
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
<<<<<<< HEAD
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrivacyScreen(),
    );
  }
}
>>>>>>> origin/develop
