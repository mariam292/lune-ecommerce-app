import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/profile/presentation/cubit/app_theme_cubit.dart';

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Switch(
          value: state == ThemeMode.dark,
          onChanged: (newValue) {
            context.read<AppThemeCubit>().changeAppTheme(
              newValue ? ThemeMode.dark : ThemeMode.light,
            );
          },
        );
      },
    );
  }
}
