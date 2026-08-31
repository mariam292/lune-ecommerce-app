import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({
    super.key,
    required this.mainText,
    required this.subText,
  });
  final String mainText, subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 36),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.primaryColor, width: 3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              mainText,
              style: AppStyles.style16Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),

        Text(
          subText,
          style: AppStyles.style12Medium.copyWith(color: AppColors.color584141),
        ),
      ],
    );
  }
}
