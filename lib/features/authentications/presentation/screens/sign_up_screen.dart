import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/auth_navigation.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_login_signup.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/or_with_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/sign_with_social_section.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 50, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderLoginSignUp(
                headerTitle: 'LUNÉ',
                headerSubTitle: 'Create Account',
              ),

              CustomTextField(labelText: 'FULL NAME', hintText: 'Malk Amr'),
              SizedBox(height: 16),

              CustomTextField(
                labelText: 'EMAIL ADDRESS',
                hintText: 'loka@gmail.com',
              ),

              SizedBox(height: 16),

              PassTextFieldSection(
                labelText: 'PASSWORD',
                hintText: '••••••••••••',
              ),
              SizedBox(height: 16),

              PassTextFieldSection(
                labelText: 'CONFIRM PASSWORD',
                hintText: '••••••••••••',
              ),

              SizedBox(height: 32),

              Elevatedbutton(
                buttontext: 'Create Account',
                btntextstyle: AppStyles.style14SemiBold.copyWith(
                  color: AppColors.whiteColor,
                ),
                buttoncolor: AppColors.primaryColor,
                onpressed: () {},
              ),

              SizedBox(height: 30),
              OrWithSection(),

              SizedBox(height: 24),

              SignWithSocialSection(),

              SizedBox(height: 50),

              AuthNavigation(
                message: 'Already have an account? ',
                navigationMessage: 'Login',
                ontap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
