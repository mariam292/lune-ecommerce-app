import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';


class CustomSummaryItem extends StatelessWidget {
  const CustomSummaryItem({
    super.key,
    required this.title,
    required this.price,
    required this.pricecolor,
  });
  final String title, price;
  final Color pricecolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.style16Regular.copyWith(
            color: AppColors.color7A6E6B,
          ),
        ),
        Spacer(),
        Text(
          '$price ',
          style: AppStyles.style16SemiBold.copyWith(color: pricecolor),
        ),
      ],
    );
  }
}
