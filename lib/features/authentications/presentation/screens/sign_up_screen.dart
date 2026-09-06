import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_button.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/text_fiield.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 
      AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 20),

              Text(
                'LUNÉ',
                style:
                 AppStyles.style32Regular.copyWith(
                  color: 
                   Color(0xFF4C0D1C),
                ),
              ),

               SizedBox(height: 8),

              Text(
                'Create Account',
                style:
                 AppStyles.style16Regular.copyWith(
                  color:  Color(0xFF2D2D2D),
                ),
              ),

               SizedBox(height: 32),

              CustomTextField(
                label: 'FULL NAME',
                hintText: 'Malk Amr',
              ),

               SizedBox(height: 16),

              CustomTextField(
                label: 'EMAIL ADDRESS',
                hintText: 'loka@gmail.com',
              ),

               SizedBox(height: 16),

              CustomTextField(
                label: 'PASSWORD',
                hintText: '••••••••••••',
                isPassword: true,
                isPasswordHidden: isPasswordHidden,
                controller: passwordController,
                onSuffixTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),

               SizedBox(height: 16),

              CustomTextField(
                label: 'CONFIRM PASSWORD',
                hintText: '••••••••••••',
                isPassword: true,
                isPasswordHidden: isConfirmPasswordHidden,
                controller: confirmPasswordController,
                onSuffixTap: () {
                  setState(() {
                    isConfirmPasswordHidden = !isConfirmPasswordHidden;
                  });
                },
              ),

               SizedBox(height: 32),

              CustomButton(
                text: 'Create Account',
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
              ),

               SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color:
                       AppColors.color5A3036,
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'OR CONTINUE WITH',
                      style:
                       AppStyles.style12Bold.copyWith(
                        color:  Color(0xFF4C0D1C),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Divider(
                      color:
                       AppColors.colorE6E2DB,
                    ),
                  ),
                ],
              ),

               SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.g_mobiledata,
                        size: 28,
                        color:
                         AppColors.blackColor,
                      ),
                      label: Text(
                        'Google',
                        style: TextStyle(
                          color:
                           AppColors.blackColor,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(vertical: 12),
                        side:  BorderSide(
                          color:
                           AppColors.colorE6E2DB,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),

                   SizedBox(width: 16),

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.apple,
                        size: 22,
                        color:
                         AppColors.blackColor,
                      ),
                      label: Text(
                        'Apple',
                        style: TextStyle(
                          color:
                           AppColors.blackColor,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(
                          color:
                           AppColors.colorE6E2DB,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

               SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: 
                    AppStyles.style14Regular.copyWith(color: Color(0xFF7A6E6B),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Login',
                      style: AppStyles.style14Regular.copyWith(color:  Color(0xFF4A101D),
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
