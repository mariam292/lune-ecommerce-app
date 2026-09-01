import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class AuthNavigation extends StatelessWidget {
  const AuthNavigation({
    super.key,
    required this.message,
    required this.navigationMessage,
    required this.ontap,
  });
  final String message, navigationMessage;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppStyles.style14Regular.copyWith(
            color: AppColors.color7A6E6B,
          ),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            navigationMessage,
            style: AppStyles.style14SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
