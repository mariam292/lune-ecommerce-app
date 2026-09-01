import 'package:flutter/material.dart';
import 'package:nti_final_project/features/app_info/presentation/screens/about_screen.dart';
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutScreen(),

    );
  }
}
  