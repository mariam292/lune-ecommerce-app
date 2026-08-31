import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class ContactFormField extends StatelessWidget {
  const ContactFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
  });

  final String hintText;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: AppStyles.style16Regular.copyWith(
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.style16Regular.copyWith(
          color: AppColors.blackColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}