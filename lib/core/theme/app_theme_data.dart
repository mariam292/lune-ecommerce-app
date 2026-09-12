import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    dialogTheme: DialogThemeData(backgroundColor: AppColors.whiteColor),
    scaffoldBackgroundColor: AppColors.backGroundColor,

    cardTheme: CardThemeData(color: AppColors.whiteColor),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backGroundColor,
      foregroundColor: AppColors.blackColor,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.blackColor),
      bodyLarge: TextStyle(color: AppColors.primaryColor),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,

      hintStyle: TextStyle(color: AppColors.color7A6E6B),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: AppColors.colorEADFD8),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.blackColor,
    ),

    dividerTheme: DividerThemeData(color: AppColors.colorD1D5DB),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
    ),

    // cardTheme: const CardThemeData(color: AppColors.whiteColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.color5A3036,
        side: BorderSide(color: AppColors.color5A3036, width: 1),
      ),
    ),
  );

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////

  static final ThemeData darkTheme = ThemeData(
    dialogTheme: DialogThemeData(backgroundColor: Color(0xFF2D2D2D)),

    cardTheme: CardThemeData(color: Color(0xFF2D2D2D)),

    //     cardTheme: const CardThemeData(
    //   color: Color(0xFF2D2D2D),
    // ),
    // dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF2D2D2D)),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white24),
      ),
    ),
    scaffoldBackgroundColor: Color(0xFF1F1F1F),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1F1F1F),
      // textStyle: const TextStyle(
      //   color: Colors.white,
      // ),
      hintStyle: TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2D2D2D),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.white,
    ),

    dividerTheme: DividerThemeData(color: Colors.white24),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
