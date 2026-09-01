import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';

class PassTextFieldSection extends StatefulWidget {
  const PassTextFieldSection({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText, hintText;

  @override
  State<PassTextFieldSection> createState() => _PassTextFieldSectionState();
}

class _PassTextFieldSectionState extends State<PassTextFieldSection> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppStyles.style14SemiBold.copyWith(
            color: AppColors.color7A6E6B,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          obscureText: isObscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),

            hintText: widget.hintText,
            hintStyle: AppStyles.style14Light.copyWith(
              color: AppColors.color7A6E6B,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.colorEADFD8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
