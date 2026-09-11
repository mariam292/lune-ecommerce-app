import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/forgot_pass_cubit.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/forgot_pass_state.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/otp_screen.dart';

import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field_forgot_reset_pass.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_forgot_reset_section.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {
        if (state is ForgotPassFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                'failed',
                style: AppStyles.style16Bold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
        } else if (state is ForgotPassSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'sending verification message',
                style: AppStyles.style16Bold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpVerification(email: emailController.text),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset('assets/icons/back-circle.svg'),
                  ),
                  SizedBox(height: 34),
                  HeaderForgotResetSection(
                    headerTitle: 'Forgot Password?',
                    headerSubTitle:
                        'No worries! Enter your registered email address below, and we will send you instructions to reset your password.',
                  ),
                  SizedBox(height: 120),
                  CustomTextFieldForgotResetPass(
                    labelText: 'Email Address',
                    hintText: 'Please Enter Your Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 30),

                  Elevatedbutton(
                    buttontext: 'Send Reset Link',
                    btntextstyle: AppStyles.style14SemiBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                    buttoncolor: AppColors.primaryColor,
                    onpressed: () {
                      context.read<ForgotPassCubit>().postEmailData(
                        emailController.text,
                      );

                      // if (emailController.text.trim().isEmpty) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your email')),
                      //   );
                      //   return;
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
