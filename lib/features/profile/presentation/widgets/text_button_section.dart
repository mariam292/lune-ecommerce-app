import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class TextButtonSection extends StatelessWidget {
  const TextButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.logout,
              size: 18,
              color: AppColors.color5A3036,
            ),
          ),

          const SizedBox(width: 8),

          Text(
            'Logout',
            style: AppStyles.style20Regular.copyWith(
              color: AppColors.color5A3036,
            ),
          ),
        ],
      ),
    );
  }
}
