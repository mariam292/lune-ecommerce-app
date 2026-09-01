import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/app_info/presentation/widgets/customappbar.dart';
import 'package:nti_final_project/features/app_info/presentation/widgets/privacy_policy_item.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(),
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 45, 24, 92),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Privacy Policy',
              style: AppStyles.style24Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: October 26, 2023',
              style: AppStyles.style12Medium.copyWith(
                color: AppColors.color584141,
              ),
            ),

            Divider(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 36),
                    Text(
                      'At LUNA, we value your privacy and are committed to protecting your personal data when you visit our website or interact with our brand.',
                      style: AppStyles.style16Medium.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),

                    PrivacyPolicyItem(
                      mainText: '1. INFORMATION WE COLLECT',
                      subText:
                          'We collect personal and technical data to process orders and enhance your luxury shopping experience.',
                    ),

                    PrivacyPolicyItem(
                      mainText: '2. HOW WE USE YOUR DATA',
                      subText:
                          'Your data helps us process orders, personalize services, and maintain platform security.',
                    ),

                    PrivacyPolicyItem(
                      mainText: '3. DATA SHARING AND DISCLOSURE',
                      subText:
                          'We only share necessary data with trusted partners to fulfill orders; we do not sell your personal information.',
                    ),

                    PrivacyPolicyItem(
                      mainText: '4. YOUR RIGHTS AND CHOICES',
                      subText:
                          'You can access, correct, or delete your data, and opt- out of marketing communications at any time.',
                    ),
                  ],
                ),
              ),
            ),
            Divider(),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'For inquiries, please contact us at ',
                    style: AppStyles.style12Medium.copyWith(
                      color: AppColors.color584141,
                    ),
                  ),

                  TextSpan(
                    text: 'privacy@luna.com.',
                    style: AppStyles.style12Medium.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
