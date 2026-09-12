import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/Main_Screen.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/custom_elevated_button.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/reset_pass_cubit.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/reset_pass_state.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/otp_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/header_forgot_reset_section.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/pass_text_field_section.dart';
import 'package:nti_final_project/features/home/presentation/cubits/category_cubit.dart';
import 'package:nti_final_project/features/home/presentation/cubits/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/screens/home_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email, required this.otp});
  final String email, otp;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passController = TextEditingController();
  final ConfirmPassController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPassCubit, ResetPassState>(
      listener: (context, state) {
        if (state is ResetPassFailureState) {
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
        } else if (state is ResetPassSuccesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'password updated successfully',
                style: AppStyles.style16Bold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => CategoryCubit()),
                  BlocProvider(create: (context) => ProductsCubit()),
                ],
                child:
                    //  HomeScreen(),
                    MainScreen(),
              ),
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
                  // back button svg icon
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset('assets/icons/back-circle.svg'),
                  ),

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
                    controller: passController,
                  ),

                  SizedBox(height: 16),

                  PassTextFieldSection(
                    labelText: 'Confirm New Password',
                    hintText: 'confirm new password',
                    controller: ConfirmPassController,
                  ),

                  SizedBox(height: 30),

                  //elevated button section
                  Elevatedbutton(
                    buttontext: 'Reset Password',
                    btntextstyle: AppStyles.style14SemiBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                    buttoncolor: AppColors.primaryColor,
                    onpressed: () {
                      if (passController.text != ConfirmPassController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Passwords do not match, please try again',
                            ),
                          ),
                        );
                        return;
                      }

                      context.read<ResetPassCubit>().postNewPassData(
                        email: widget.email,
                        otp: widget.otp,
                        newPassword: passController.text,
                      );
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
