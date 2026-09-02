import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import '../../../../core/app_colors.dart';

class CustomTextFieldForgotResetPass extends StatelessWidget {
  final String labelText;
  final String hintText;

  const CustomTextFieldForgotResetPass({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppStyles.style14SemiBold.copyWith(
            color: AppColors.color7A6E6B,
          ),
        ),
        SizedBox(height: 8),

        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyles.style14Light.copyWith(
              color: AppColors.color7A6E6B,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.colorEADFD8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
