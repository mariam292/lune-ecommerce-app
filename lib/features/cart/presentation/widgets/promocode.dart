import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';


class PromoCodeSection extends StatelessWidget {
  const PromoCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.colorEADFD8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Promo Code',
                hintStyle: AppStyles.style14SemiBold.copyWith(
                  color: AppColors.color7A6E6B,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),

        SizedBox(
          width: 90,
          child: Elevatedbutton(
            buttontext: 'Apply',
            btntextstyle: AppStyles.style14SemiBold.copyWith(
              color: AppColors.whiteColor,
            ),
            buttoncolor: AppColors.primaryColor, onpressed: () {  },
          ),
        ),
      ],
    );
  }
}
