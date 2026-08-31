import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';

class CategoryTopBar extends StatelessWidget {
  const CategoryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorD1D5DB,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: AppColors.color5A3036,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.color5A3036,
            ),
          ),
        ],
      ),
    );
  }
}