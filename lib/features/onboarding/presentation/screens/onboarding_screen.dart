import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/onbordingcover.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.backGroundColor.withValues(alpha: 0.1),
                        AppColors.backGroundColor.withValues(alpha: 0.8),
                        AppColors.backGroundColor,
                      ],
                      stops: [0.70, 0.75, 0.75, 0.75],
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  child: Text(
                    "LUNÉ",
                    style: AppStyles.style24Regular.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.backGroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Discover Your Style",
                    style: AppStyles.style32Regular.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Explore curated collections of premium feminine accessories, designed for the modern muse.",
                    textAlign: TextAlign.center,
                    style: AppStyles.style14Regular.copyWith(
                      color: AppColors.color7A6E6B,
                    ),
                  ),
                  SizedBox(height: 36),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: Elevatedbutton(
                      buttontext: 'Next',
                      btntextstyle: AppStyles.style16SemiBold.copyWith(
                        color: AppColors.whiteColor,
                      ),
                      buttoncolor: AppColors.primaryColor,
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
