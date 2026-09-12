import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';

import 'package:nti_final_project/features/authentications/presentation/cubit/signup_cubit.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/signup_state.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/otp_register_screen.dart';

import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field_forgot_reset_pass.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/navigation_elevated_button.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/signup_header.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/otp_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OtpRegisterScreen(email: emailController.text.trim()),
              ),
            );
          }

          if (state is SignupError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  SignupHeader(),
                  const SizedBox(height: 16),
                  CustomTextFieldForgotResetPass(
                    labelText: 'FIRST NAME',
                    hintText: 'Enter Your First Name',
                    controller: firstNameController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextFieldForgotResetPass(
                    labelText: 'LAST NAME',
                    hintText: 'Enter Your Last Name',
                    controller: lastNameController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextFieldForgotResetPass(
                    labelText: 'EMAIL ADDRESS',
                    hintText: 'Enter Your Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 12),
                  PassTextFieldSection(
                    labelText: 'PASSWORD',
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 12),
                  PassTextFieldSection(
                    labelText: 'CONFIRM PASSWORD',
                    hintText: 'Confirm Your Password',
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      final isLoading = state is SignupLoading;

                      return Elevatedbutton(
                        buttontext: isLoading
                            ? 'Creating Account...'
                            : 'Create Account',
                        btntextstyle: const TextStyle(color: Colors.white),
                        buttoncolor: AppColors.primaryColor,
                        onpressed: () {
                          if (isLoading) {
                            return;
                          }

                          context.read<SignupCubit>().register(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  NavigationElevatedButton(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppStyles.style14Regular.copyWith(
                          color: const Color(0xFF7A6E6B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: AppStyles.style14Regular.copyWith(
                            color: const Color(0xFF4A101D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
