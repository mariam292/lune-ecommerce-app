import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field_forgot_reset_pass.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/navigation_elevated_button.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/signup_header.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  Future<void> register() async {
    final Dio dio = Dio();

    final fullName = nameController.text.trim().split(' ');

    final firstName = fullName.first;
    final lastName =
        fullName.length > 1 ? fullName.sublist(1).join(' ') : '';

    final response = await dio.post(
      "https://accessories-eshop.runasp.net/api/auth/register",
      data: {
        "email": emailController.text,
        "password": passwordController.text,
        "firstName": firstName,
        "lastName": lastName,
      },
    );

    print(response.data);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),

              SignupHeader(),

              SizedBox(height: 16),

              CustomTextFieldForgotResetPass(
                labelText: 'FULL NAME',
                hintText: 'Malk Amr',
                controller: nameController,
              ),

              SizedBox(height: 12),

              CustomTextFieldForgotResetPass(
                labelText: 'EMAIL ADDRESS',
                hintText: 'loka@gmail.com',
                controller: emailController,
              ),

              SizedBox(height: 12),

              PassTextFieldSection(
                labelText: 'PASSWORD',
                hintText: 'Enter Your Password',
                controller: passwordController,
              ),

              SizedBox(height: 12),

              PassTextFieldSection(
                labelText: 'CONFIRM PASSWORD',
                hintText: 'Confirm Your Password',
                controller: confirmPasswordController,
              ),

              SizedBox(height: 24),

              Elevatedbutton(
                buttontext: 'Create Account',
                btntextstyle: TextStyle(
                  color: Colors.white,
                ),
                buttoncolor: AppColors.primaryColor,
                onpressed: register,
              ),

              SizedBox(height: 24),

              NavigationElevatedButton(),

              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppStyles.style14Regular.copyWith(
                      color: Color(0xFF7A6E6B),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Login',
                      style: AppStyles.style14Regular.copyWith(
                        color: Color(0xFF4A101D),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}