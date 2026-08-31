import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'LUNE',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcom BACK',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 40),
              
              // استخدام الـ Custom Widget للإيميل
              CustomTextField(
                label: 'EMAIL ADDRESS',
                hintText: 'alexa@example.com',
              ),
              
              const SizedBox(height: 16),
              
              // استخدام الـ Custom Widget للباسورد
              CustomTextField(
                label: 'PASSWORD',
                hintText: '••••••••••••',
                isPassword: true,
                isPasswordHidden: isPasswordHidden,
                onSuffixTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),
              
              const SizedBox(height: 16),
              
              // صف تذكرني وفلست كلمة المرور
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: remember,
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.color7A6E6B,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.color7A6E6B,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // زرار تسجيل الدخول
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // الخط الفاصل OR CONTINUE WITH
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.colorEADFD8,
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.color7A6E6B,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.colorEADFD8,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // أزارير التواصل الاجتماعي (جوجل وأبل)
              Row(
                children: [
                 Expanded(
  child: OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.g_mobiledata, size: 28, color: AppColors.blackColor),
    label: const Text(
      'Google',
      style: TextStyle(color: AppColors.blackColor),
    ),
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12),
      side: const BorderSide(color: AppColors.colorEADFD8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
),

                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple, color: AppColors.blackColor),
                      label: const Text(
                        'Apple',
                        style: TextStyle(color: AppColors.blackColor),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppColors.colorEADFD8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // رابط إنشاء حساب جديد
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.color7A6E6B,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
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