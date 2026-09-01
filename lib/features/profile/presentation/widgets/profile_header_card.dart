import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.colorD1D5DB,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 123,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profileee.jpg',
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: 137,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(
                  'Sarah Johnson',
                  style: AppStyles.style24Regular.copyWith(
                    color: AppColors.color5A3036,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 169,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  'sarah.j@example.com',
                  style: AppStyles.style14Regular.copyWith(
                    color: AppColors.color7A6E6B,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 207,
            left: 110,
            child: SizedBox(
              width: 122,
              height: 29,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  side: const BorderSide(
                    color: AppColors.color5A3036,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  style: AppStyles.style14Regular.copyWith(
                    color: AppColors.color5A3036,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}