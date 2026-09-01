import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

class ContactHeaderSection extends StatelessWidget {
  const ContactHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Get In Touch',
          textAlign: TextAlign.center,
          style: AppStyles.style28Medium.copyWith(
           
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'We are here to assist you with any inquiries regarding our collections, your orders, or bespoke requests.',
          textAlign: TextAlign.center,
          style: AppStyles.style16Regular.copyWith(
           
            color: AppColors.color584141,
          ),
        ),
      ],
    );
  }
}