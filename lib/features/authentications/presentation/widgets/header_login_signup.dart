import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class HeaderLoginSignUp extends StatelessWidget {
  const HeaderLoginSignUp({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });
  final String headerTitle, headerSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: AppStyles.style32Bold.copyWith(
            color: AppColors.primaryColor,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          headerSubTitle,
          style: AppStyles.style16Regular.copyWith(color: AppColors.blackColor),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}