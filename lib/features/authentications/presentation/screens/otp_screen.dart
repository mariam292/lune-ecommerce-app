import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
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

  final List<TextEditingController> controllers = List.generate(4, (index) {
    return TextEditingController();
  });

  Future<void> resendOtp() async {
    final Dio dio = Dio();

    final response = await dio.post(
      "https://accessories-eshop.runasp.net/api/auth/resend-otp",
      data: {
        "email": email,
      },
    );

    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 
       AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 100),

              Text(
  'Verify Your Email',
  style: AppStyles.style28Light.copyWith(
    color:
     Color(0xFF4A101D),
  ),
),
                
               SizedBox(height: 12),

             Text(
  'Enter the 4-digit code sent to your email\n'
  '$email',
  textAlign: TextAlign.center,
  style: AppStyles.style14Light.copyWith(
    color: Color(0xFF7A6E6B),
  ),
),
              
               SizedBox(height: 36),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
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
                        fillColor:
                        AppColors.whiteColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                          color: 
                          AppColors.colorEADFD8
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                            color:
                             AppColors.colorEADFD8
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                            color: 
                            AppColors.color5A3036,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

               SizedBox(height: 36),

              CustomButton(
                text: 'Verify',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPassword(),
                  ),
                ),
              ),

               SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Didn't receive the code? ",
                    style:AppStyles.style14SemiBold.copyWith(color: Color(0xFF7A6E6B),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      resendOtp();
                    },
                    child:  Text(
                      'Resend (0:59)',
                      style: AppStyles.style14SemiBold.copyWith(color:Color(0xFF4A101D) ,
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
