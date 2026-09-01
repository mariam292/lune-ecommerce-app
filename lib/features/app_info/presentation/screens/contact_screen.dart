import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We would love to hear from you.',
                      style: AppStyles.style20Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'If you have any questions or need help, '
                      'feel free to contact us.',
                      style: AppStyles.style14Regular.copyWith(
                        color: AppColors.color7A6E6B,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                  
                    

    // user data section (contact info card wedget)
              

                    const SizedBox(height: 16),

                    Text(
                      'Send us a message',
                      style: AppStyles.style16SemiBold.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildTextField(
                      hintText: 'Your Name',
                    ),

                    const SizedBox(height: 12),

                    _buildTextField(
                      hintText: 'Your Email',
                    ),

                    const SizedBox(height: 12),

                    _buildTextField(
                      hintText: 'Message',
                      maxLines: 5,
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Send Message',
                          style: AppStyles.style14SemiBold.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                size: 22,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Contact Us',
            style: AppStyles.style20Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      style: AppStyles.style14Regular.copyWith(
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.style14Regular.copyWith(
          color: AppColors.color7A6E6B,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}