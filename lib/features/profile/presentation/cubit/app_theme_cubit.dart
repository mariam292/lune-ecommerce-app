import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.light);
  bool isDarkMode = false;

  changeAppTheme(ThemeMode newTheme) {
    if (newTheme == ThemeMode.dark) {
      isDarkMode = true;
    } else {
      isDarkMode = false;
    }
    emit(newTheme);
  }
}
