
import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:nti_final_project/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 68,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.colorD1D5DB,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: AppColors.color5A3036,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Text(
                    'My Profile',
                    style: AppStyles.style28Regular.copyWith(
                      color: AppColors.color5A3036,
                    ),
                  ),
                ],
              ),
            ),

            // Profile Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  16,
                  24,
                  24,
                ),
                child: Column(
                  children: [
                    const ProfileHeaderCard(),

                    const SizedBox(height: 24),

                    // Profile Settings
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.colorD1D5DB,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Column(
                        children: [
                          ProfileMenuItem(
                            icon: 'assets/icons/dark_mode.svg',
                            title: 'Dark Mode',
                            showArrow: false,
                          ),

                          ProfileMenuItem(
                            icon: 'assets/icons/change_password.svg',
                            title: 'Change Password',
                          ),

                          ProfileMenuItem(
                            icon: 'assets/icons/privacy_policy.svg',
                            title: 'Privacy Policy',
                          ),

                          ProfileMenuItem(
                            icon: 'assets/icons/language.svg',
                            title: 'Language',
                          ),

                          ProfileMenuItem(
                            icon: 'assets/icons/about_us.svg',
                            title: 'About Us',
                          ),

                          ProfileMenuItem(
                            icon: 'assets/icons/contact_us.svg',
                            title: 'Contact Us',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Logout
                    Container(
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.colorD1D5DB,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout,
                              size: 18,
                              color: AppColors.color5A3036,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              'Logout',
                              style: AppStyles.style16Regular.copyWith(
                                color: AppColors.color5A3036,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Custom Bottom Navigation Bar
 
    );
  }
}