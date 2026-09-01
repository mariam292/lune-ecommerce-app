import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_left.svg"),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "LUNE",
          style: AppStyles.style24Bold.copyWith(color: AppColors.primaryColor),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart_bag.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Text(
              'Our Story',
              style: AppStyles.style28SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),

            const SizedBox(height: 25),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/Background.png',
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              'A legacy of light, sculpted into form. Every piece of LUNA jewelry is born from a dialogue between raw materials and refined skill. Our ateliers marry traditional craftsmanship with contemporary design to create heirlooms for the modern era.',
              textAlign: TextAlign.center,
              style: AppStyles.style16Regular.copyWith(
                color: AppColors.blackColor,
              ),
            ),

            const SizedBox(height: 40),

            Text(
              'Eleanor Vance',
              style: AppStyles.style36Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'FOUNDER & CREATIVE DIRECTOR',
              style: AppStyles.style16Medium.copyWith(
                color: AppColors.blackColor,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
