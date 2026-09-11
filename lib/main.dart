import 'package:flutter/material.dart';
import 'package:nti_final_project/core/theme/app_theme_data.dart';
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
