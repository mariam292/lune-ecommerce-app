import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class NavigationElevatedButton extends StatelessWidget {
  NavigationElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.color5A3036,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'OR CONTINUE WITH',
                style: AppStyles.style12Bold.copyWith(
                  color: Color(0xFF4C0D1C),
                ),
              ),
            ),

            Expanded(
              child: Divider(
                color: AppColors.colorE6E2DB,
              ),
            ),
          ],
        ),

        SizedBox(height: 24),

        Row(
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
                  style: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(
                    color: AppColors.colorE6E2DB,
                  ),
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
                icon: Icon(
                  Icons.apple,
                  size: 22,
                  color: AppColors.blackColor,
                ),
                label: Text(
                  'Apple',
                  style: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(
                    color: AppColors.colorE6E2DB,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}