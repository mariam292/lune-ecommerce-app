import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/Main_Screen.dart';
import 'package:nti_final_project/core/vaildators.dart';
import 'package:nti_final_project/features/authentications/data/data_source/authentication_remotedata_source.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/Log_In_state.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/login_cubit.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/forgot_password_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/sign_up_screen.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
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
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> mykey = GlobalKey<FormState>();
  final AuthApi authApi = AuthApi();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: mykey,
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
                CustomTextField(
                  label: 'EMAIL ADDRESS',
                  hintText: 'alexa@example.com',
                  controller: emailController,
                  validator: (email) {
                    return Validator.validateEmail(email!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'PASSWORD',
                  hintText: '••••••••••••',
                  controller: passwordController,
                  isPassword: true,
                  isPasswordHidden: isPasswordHidden,
                  validator: (password) {
                    return Validator.validatePassword(password!);
                  },
                  onSuffixTap: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
                const SizedBox(height: 16),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
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
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: BlocConsumer< LoginCubit, LogInState>(
                    listener: (context, state) {
                       if(state is LogInSuccessState)
                       {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                       }
                       else if(state is LogInFailureState)
                       {
                        ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error:${state.error}"),backgroundColor: AppColors.primaryColor,
                                ),
                              );
                       }
                           else if(state is LogInLoadingState)
                       {
                        ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:  Center(child: CircularProgressIndicator(),),backgroundColor: Colors.amber,
                                ),
                              );
                       }
                    },
                    builder: (context, state) {

                      return     ElevatedButton(
                        onPressed: () async {
                          if (mykey.currentState!.validate()) {
                              
                           await context.read<LoginCubit>().Log_In(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: 
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
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
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.g_mobiledata,
                          size: 28,
                          color: AppColors.blackColor,
                        ),
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
                        icon: const Icon(
                          Icons.apple,
                          color: AppColors.blackColor,
                        ),
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
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
      ),
    );
  }
}
