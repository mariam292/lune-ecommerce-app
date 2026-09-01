import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.suffixiconpath, required this.ontap,
  });

  final String icon;
  final String title;
  final String suffixiconpath;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // Menu icon
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(icon, width: 24, height: 24),
            ),

            const SizedBox(width: 16),

            // Menu title
            Text(
              title,
              style: AppStyles.style16Regular.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            Spacer(),

            // Arrow
            InkWell(
              onTap:ontap,
              child: SvgPicture.asset(suffixiconpath, width: 23, height: 23),
            ),
          ],
        ),
      ),
    );
  }
}
