import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

class ContactTopAppBar extends StatelessWidget {
  const ContactTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          height: 64,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.colorFDFBF7,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Color.fromRGBO(76, 13, 28, 1),
                ),
              ),
              Text(
                'LUNÉ',
                style: AppStyles.style36Regular.copyWith(
                 
                  color: AppColors.primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}