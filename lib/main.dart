import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/theme/app_theme_data.dart';
import 'package:nti_final_project/features/profile/presentation/cubit/app_theme_cubit.dart';
import 'package:nti_final_project/features/profile/presentation/screens/profile_screen.dart';
import 'package:nti_final_project/features/spalsh/spalsh_screen.dart';

void main() {
  runApp(const LuneApp());
}

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: state,
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        },
      ),
=======
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Splash(),
>>>>>>> origin/raghad_features
    );
  }
}
