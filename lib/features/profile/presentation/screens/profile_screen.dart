import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/app_info/presentation/screens/about_screen.dart';
import 'package:nti_final_project/features/app_info/presentation/screens/contact_screen.dart';
import 'package:nti_final_project/features/app_info/presentation/screens/privacy_screen.dart';
import 'package:nti_final_project/features/app_info/presentation/widgets/privacy_policy_item.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/change_password_screen.dart';
import 'package:nti_final_project/features/product/presentation/screens/add_product_screen.dart';
import 'package:nti_final_project/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:nti_final_project/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:nti_final_project/features/profile/presentation/widgets/text_button_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 68,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/icons/back-circle.svg"),
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
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  children: [
                    const ProfileHeaderCard(),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.colorD1D5DB),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ProfileMenuItem(
                            icon: 'assets/icons/dark_mode.svg',
                            title: 'Dark Mode',
                            suffixiconpath:
                                'assets/icons/Toggle Switch_margin.svg',
                            ontap: () {},
                          ),
                          Divider(),

                          ProfileMenuItem(
                            icon: 'assets/icons/change_password.svg',
                            title: 'Change Password',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(),
                              ),
                            ),
                          ),
                          Divider(),

                          ProfileMenuItem(
                            icon: 'assets/icons/privacy_policy.svg',
                            title: 'Privacy Policy',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivacyScreen(),
                              ),
                            ),
                          ),
                          Divider(),

                          ProfileMenuItem(
                            icon: 'assets/icons/language.svg',
                            title: 'Language',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () {},
                          ),
                          Divider(),

                          ProfileMenuItem(
                            icon: 'assets/icons/about_us.svg',
                            title: 'About Us',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutScreen(),
                              ),
                            ),
                          ),
                          Divider(),

                          ProfileMenuItem(
                            icon: 'assets/icons/contact_us.svg',
                            title: 'Contact Us',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactScreen(),
                              ),
                            ),
                          ),
                          Divider(),
                          ProfileMenuItem(
                            icon: 'assets/icons/carbon_add-alt.svg',
                            title: 'Add New Product',
                            suffixiconpath: 'assets/icons/vector_2.svg',
                            ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductScreen(),
                              ),
                            ),
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
                        border: Border.all(color: AppColors.colorD1D5DB),
                      ),
                      child: TextButtonSection(),
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
