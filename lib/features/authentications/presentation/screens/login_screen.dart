import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/sign_up_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/auth_navigation.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_login_signup.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/or_with_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/remmeber_me_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/sign_with_social_section.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';
import '../../../../core/app_colors.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderLoginSignUp(
                headerTitle: 'LUNE',
                headerSubTitle: 'Welcom BACK',
              ),

              // email
              CustomTextField(
                labelText: 'EMAIL ADDRESS',
                hintText: 'alexa@example.com',
              ),

              const SizedBox(height: 16),

              // password
              PassTextFieldSection(
                labelText: 'PASSWORD',
                hintText: '••••••••••••',
              ),

              const SizedBox(height: 16),

              //remember me section
              RememberMeSection(),

              SizedBox(height: 30),

              // login elevated button
              Elevatedbutton(
                buttontext: 'Log In',
                btntextstyle: AppStyles.style16SemiBold.copyWith(
                  color: AppColors.whiteColor,
                ),
                buttoncolor: AppColors.primaryColor,
                onpressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),

              SizedBox(height: 40),

              OrWithSection(),

              const SizedBox(height: 24),

              // social login buttons
              SignWithSocialSection(),

              SizedBox(height: 100),

              AuthNavigation(
                message: "Don't have an account? ",
                navigationMessage: 'Sign Up',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (Signup())),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
