import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/otp_cubit.dart';
import 'package:nti_final_project/features/authentications/presentation/cubit/otp_state.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/reset_password_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_button.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() {
    return _OtpVerificationState();
  }
}

class _OtpVerificationState extends State<OtpVerification> {
  final String email = 'Loka@gmail.com';

  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  Timer? timer;
  int seconds = 59;

  String get otp {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      seconds = 59;
    });

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();

    for (final controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResetPassword(),
              ),
            );
          }

          if (state is OtpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Verify Your Email',
                    style: AppStyles.style28Light.copyWith(
                      color: const Color(0xFF4A101D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Enter the 4-digit code sent to your email\n$email',
                    textAlign: TextAlign.center,
                    style: AppStyles.style14Light.copyWith(
                      color: const Color(0xFF7A6E6B),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) {
                        return SizedBox(
                          width: 55,
                          height: 55,
                          child: TextField(
                            controller: controllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: AppStyles.style20Bold,
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.whiteColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.colorEADFD8,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.colorEADFD8,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.color5A3036,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }

                              setState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 36),
                  BlocBuilder<OtpCubit, OtpState>(
                    builder: (context, state) {
                      final isLoading = state is OtpLoading;

                      return CustomButton(
                        text: isLoading ? 'Verifying...' : 'Verify',
                        onPressed: () {
                          if (isLoading) {
                            return;
                          }

                          if (otp.length != 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter the 4-digit OTP',
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<OtpCubit>().validateOtp(
                                email: email,
                                otp: otp,
                              );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: AppStyles.style14SemiBold.copyWith(
                          color: const Color(0xFF7A6E6B),
                        ),
                      ),
                      GestureDetector(
                        onTap: seconds == 0
                            ? () {
                                context.read<OtpCubit>().resendOtp(
                                      email: email,
                                    );
                                startTimer();
                              }
                            : null,
                        child: Text(
                          'Resend (0:${seconds.toString().padLeft(2, '0')})',
                          style: AppStyles.style14SemiBold.copyWith(
                            color: seconds == 0
                                ? const Color(0xFF4A101D)
                                : Colors.grey,
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
      ),
    );
  }
}
