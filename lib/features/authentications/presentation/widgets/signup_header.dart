import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class SignupHeader extends StatelessWidget {
  SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),

        Text(
          'LUNÉ',
          style: AppStyles.style32Regular.copyWith(
            color: Color(0xFF4C0D1C),
          ),
        ),

        SizedBox(height: 8),

        Text(
          'Create Account',
          style: AppStyles.style16Regular.copyWith(
            color: Color(0xFF2D2D2D),
          ),
        ),

        SizedBox(height: 32),
      ],
    );
  }
}