import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/general_text_field_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_forgot_reset_section.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                headerTitle: 'Forgot Password?',
                headerSubTitle:
                    'No worries! Enter your registered email address below, and we will send you instructions to reset your password.',
              ),

              SizedBox(height: 120),

              //textField section
              GeneralTextFieldSection(
                labelText: 'Email Address',
                hintText: 'Please Enter Your Email',
              ),

              SizedBox(height: 30),

              //elevated button section
              Elevatedbutton(
                buttontext: 'Send Reset Link',
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
