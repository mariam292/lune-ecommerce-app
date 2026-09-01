import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';
import 'contact_form_field.dart';

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final orderCtrl = TextEditingController();
  final messageCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    orderCtrl.dispose();
    messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.colorD5C2C5),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Send a Message',
            style: AppStyles.style32Regular.copyWith(
            
              color: AppColors.primaryColor,
              height: 1,
            ),
          ),
          const SizedBox(height: 48),
          ContactFormField(hintText: 'Full Name', controller: nameCtrl),
          const SizedBox(height: 24),
          ContactFormField(hintText: 'Email Address', controller: emailCtrl),
          const SizedBox(height: 24),
          ContactFormField(
            hintText: 'Order Number (optional)',
            controller: orderCtrl,
          ),
          const SizedBox(height: 24),
          ContactFormField(
            hintText: 'Your Message',
            controller: messageCtrl,
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: Text(
                'SEND MESSAGE',
                style: AppStyles.style14SemiBold.copyWith(
               
                  color: AppColors.whiteColor,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}