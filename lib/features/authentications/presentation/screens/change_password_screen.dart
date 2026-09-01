import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import '../../../../core/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                // Back Button & Title
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: SvgPicture.asset('assets/icons/back-circle.svg'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Change Password',
                      style: AppStyles.style24Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),

                // Card Container
                Container(
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withValues(alpha: 0.03),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Enter New Password Details',
                          style: AppStyles.style20Regular.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),

                      // Current Password
                      PassTextFieldSection(
                        labelText: 'CURRENT PASSWORD',
                        hintText: '••••••••••••',
                      ),
                      SizedBox(height: 16),

                      // New Password
                      PassTextFieldSection(
                        labelText: 'NEW PASSWORD',
                        hintText: '••••••••••••',
                      ),
                      SizedBox(height: 16),

                      // Confirm Password
                      PassTextFieldSection(
                        labelText: 'CONFIRM NEW PASSWORD',
                        hintText: '••••••••••••',
                      ),
                      SizedBox(height: 24),

                      // Update Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'update password',
                            style: AppStyles.style14SemiBold.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Forgot Password Link
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppStyles.style14Regular.copyWith(
                              color: AppColors.color7A6E6B,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
