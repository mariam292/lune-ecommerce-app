import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/authentications/presentation/widgets/custom_text_field_forgot_reset_pass.dart';
import '../../../../core/app_colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar: Back Button & Title
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset('assets/icons/back-circle.svg'),
                    ),

                    SizedBox(width: 16),

                    Text(
                      'Add New Product',
                      style: AppStyles.style24Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Add Photos Box
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryColor.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryColor,
                        size: 28,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Add Photos',
                        style: AppStyles.style12Medium.copyWith(
                          color: AppColors.colorA7736D,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Product Name
                CustomTextFieldForgotResetPass(
                  labelText: 'PRODUCT NAME',
                  hintText: "e.g. L'Aura Satin Ribbon",
                ),

                SizedBox(height: 16),

                // Description
                CustomTextFieldForgotResetPass(
                  labelText: 'DESCRIPTION',
                  hintText: "Enter product description...",
                ),
                SizedBox(height: 16),

                // Category
                CustomTextFieldForgotResetPass(
                  labelText: 'CATEGORY',
                  hintText: "Select category",
                ),
                SizedBox(height: 16),

                // Price and Stock in a Row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldForgotResetPass(
                        labelText: 'PRICE',
                        hintText: "\$0.00",
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFieldForgotResetPass(
                        labelText: 'STOCK',
                        hintText: "0",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),

                // Publish Product Button
                Elevatedbutton(
                  buttontext: 'Publish Product',
                  btntextstyle: AppStyles.style14SemiBold.copyWith(
                    color: AppColors.whiteColor,
                  ),
                  buttoncolor: AppColors.primaryColor,
                  onpressed: () {},
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
