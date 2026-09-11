import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backGroundColor),
      darkTheme: ThemeData(scaffoldBackgroundColor: AppColors.blackColor),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
