import 'package:flutter/material.dart';

import 'contact_info_card.dart';

class ContactOptionsSection extends StatelessWidget {
  const ContactOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContactInfoCard(
          iconPath: 'assets/icons/phone.svg',
          label: 'PHONE',
          value: '+1 (800) 555-LUNA',
        ),
        SizedBox(height: 24),
        ContactInfoCard(
          iconPath: 'assets/icons/email.svg',
          label: 'EMAIL',
          value: 'concierge@luna.com',
        ),
        SizedBox(height: 24),
        ContactInfoCard(
          iconPath: 'assets/icons/chat.svg',
          label: 'SOCIAL',
          value: '@LunaJewelry',
        ),
      ],
    );
  }
}