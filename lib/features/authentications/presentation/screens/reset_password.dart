import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_forgot_reset_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back button svg icon
              SvgPicture.asset('assets/icons/back-circle.svg'),

              SizedBox(height: 34),

              //header section
              HeaderForgotResetSection(
                headerTitle: 'Reset Password',
                headerSubTitle:
                    'Create a secure new password to ensure your account security.',
              ),

              SizedBox(height: 120),

              //password textField section
              PassTextFieldSection(
                labelText: 'New Password',
                hintText: 'Enter a strong passord',
              ),

              SizedBox(height: 16),

              PassTextFieldSection(
                labelText: 'Confirm New Password',
                hintText: 'confirm new password',
              ),

              SizedBox(height: 30),

              //elevated button section
              Elevatedbutton(
                buttontext: 'Reset Password',
                btntextstyle: AppStyles.style14SemiBold,
                buttoncolor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
