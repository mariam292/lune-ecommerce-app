import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.colorD5C2C5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: AppStyles.style14SemiBold.copyWith(
            
              color: AppColors.blackColor,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppStyles.style16Regular.copyWith(
          
              color: AppColors.color584141,
            ),
          ),
        ],
      ),
    );
  }
}