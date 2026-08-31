import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class HeaderForgotResetSection extends StatelessWidget {
  const HeaderForgotResetSection({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });
  final String headerTitle, headerSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          headerTitle,
          style: AppStyles.style28Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          headerSubTitle,
          textAlign: TextAlign.center,
          style: AppStyles.style14Regular.copyWith(
            color: AppColors.color7A6E6B,
          ),
        ),
      ],
    );
  }
}
