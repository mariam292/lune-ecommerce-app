import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class SeasonalOffers extends StatelessWidget {
  const SeasonalOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/Featured Promotion.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 304,

            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                "assets/images/Gradient.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.asset("assets/images/Gradient.png",width: double.infinity,height: 322,),
          Positioned(
            top: 160,
            bottom: 0,
            right: 0,
            left: 0,

            child: Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 13,
                bottom: 0,
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "SEASONAL EXCLUSIVE",
                    style: AppStyles.style12Medium.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "Up to 20% OFF",
                    style: AppStyles.style28SemiBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "SHOP NOW",
                        style: AppStyles.style14SemiBold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
