import 'package:flutter/material.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/reset_password.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResetPassword(),
    );
  }
}
