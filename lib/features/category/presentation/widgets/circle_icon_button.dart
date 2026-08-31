import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

// دايرة بيضا 36x36 ببوردر EADFD8 وجواها ايقونة، مستخدمة في زرار الرجوع والبحث
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.colorEADFD8, width: 1),
        ),
        child: Icon(icon, size: 18, color: AppColors.blackColor),
      ),
    );
  }
}