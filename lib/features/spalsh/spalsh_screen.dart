import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/onboarding/presentation/screens/onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/glow-container.png'),

              SizedBox(height: 20),

              Text(
                'CURATED ELEGANCE',
                style: AppStyles.style16Regular.copyWith(
                  color: AppColors.color7A6E6B,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
