import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/change_password_screen.dart';
import 'package:nti_final_project/features/authentications/presentation/screens/forgot_password_screen.dart';

class RememberMeSection extends StatefulWidget {
  const RememberMeSection({super.key});

  @override
  State<RememberMeSection> createState() => _RememberMeSectionState();
}

class _RememberMeSectionState extends State<RememberMeSection> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
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
            SizedBox(width: 8),
            Text(
              'Remember me',
              style: AppStyles.style14Medium.copyWith(
                color: AppColors.colorA7736D,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPassword()),
            );
          },
          child: Text(
            'Forgot password?',
            style: AppStyles.style14Medium.copyWith(
              color: AppColors.colorA7736D,
            ),
          ),
        ),
      ],
    );
  }
}
