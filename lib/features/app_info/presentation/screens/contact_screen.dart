import 'package:flutter/material.dart';
import 'package:nti_final_project/core/app_colors.dart';
import 'package:nti_final_project/core/app_text_style.dart';
import 'package:nti_final_project/core/common_widgets/elevatedbutton.dart';
import 'package:nti_final_project/features/app_info/presentation/widgets/customappbar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      appBar:Customappbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              'Get In Touch',
              style: AppStyles.style28SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'We are here to assist you with any inquiries regarding our collections, your orders, or bespoke requests.',
                textAlign: TextAlign.center,
                style: AppStyles.style14Regular.copyWith(
                  color: AppColors.color7A6E6B,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),

            _buildContactCard(
              icon: Icons.phone_outlined,
              title: 'PHONE',
              value: '+1 (800) 555-LUNA',
            ),
            const SizedBox(height: 12),
            _buildContactCard(
              icon: Icons.email_outlined,
              title: 'EMAIL',
              value: 'concierge@luna.com',
            ),
            const SizedBox(height: 12),
            _buildContactCard(
              icon: Icons.chat_bubble_outline,
              title: 'SOCIAL',
              value: '@LunaJewelry',
            ),

            const SizedBox(height: 24),

            // Form Container
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Send a Message',
                    style: AppStyles.style32Regular.copyWith(color: AppColors.primaryColor)
                  ),
                  const SizedBox(height: 20),

                  _buildUnderlineTextField(hintText: 'Full Name'),
                  const SizedBox(height: 16),
                  _buildUnderlineTextField(
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildUnderlineTextField(
                    hintText: 'Order Number (optional)',
                  ),
                  const SizedBox(height: 16),
                  _buildUnderlineTextField(
                    hintText: 'Your Message',
                    maxLines: 2,
                  ),
                  const SizedBox(height: 28),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Elevatedbutton(buttontext: 'SEND MESSAGE', btntextstyle: AppStyles.style16SemiBold.copyWith(color: AppColors.whiteColor), buttoncolor: AppColors.primaryColor,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // WIDGETS BUILDERS
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 22),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppStyles.style12Regular.copyWith(color: AppColors.backGroundColor)
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppStyles.style12Regular.copyWith(color: AppColors.blackColor)
          ),
        ],
      ),
    );
  }

  Widget _buildUnderlineTextField({
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color:AppColors.color7A6E6B,
          fontSize: 13,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.color7A6E6B),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}