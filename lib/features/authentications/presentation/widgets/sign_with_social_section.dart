import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';

class SignWithSocialSection extends StatelessWidget {
  const SignWithSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.g_mobiledata,
              size: 28,
              color: AppColors.blackColor,
            ),
            label: Text(
              'Google',
              style: TextStyle(color: AppColors.blackColor),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: AppColors.colorEADFD8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        SizedBox(width: 16),

        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.apple, color: AppColors.blackColor),
            label: Text('Apple', style: TextStyle(color: AppColors.blackColor)),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: AppColors.colorEADFD8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}