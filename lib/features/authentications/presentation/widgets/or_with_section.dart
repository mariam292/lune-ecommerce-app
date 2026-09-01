import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class OrWithSection extends StatelessWidget {
  const OrWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.colorEADFD8)),
        Text(
          ' Or Continue With ',
          style: AppStyles.style14Medium.copyWith(color: AppColors.colorA7736D),
        ),

        Expanded(child: Divider(color: AppColors.colorEADFD8)),
      ],
    );
  }
}