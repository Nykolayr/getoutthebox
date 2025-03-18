import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

class PrivacyAuth extends StatelessWidget {
  const PrivacyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(right: 16, bottom: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Privacy Policy, \nTerms & Conditions',
                      style: TextStylesManager.headerMainMenu,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getMarginOrPadding(horizontal: 8),
              child: Column(
                children: [
                  _textRich(
                    '1. Collection and Use of InformationWe collect only the information necessary to \nprovide our services, which may include personal data such as name, contact information, and IP address. This data is used solely to ensure service functionality and improve user experience.',
                  ),
                  _textRich(
                    '2. Sharing Data with Third PartiesWe do not share personal data with third parties except as required by law or necessary to fulfill the service (e.g., payment processing).',
                  ),
                  _textRich(
                      '3. Data SecurityWe use advanced security technologies to protect your data from unauthorized access, leaks, and other potential risks.'),
                  _textRich(
                      '4. User RightsYou have the right to access, correct, delete your data, and withdraw consent for its processing at \nany time.'),
                  _textRich(
                      '5. Changes to the PolicyWe reserve the right to modify this privacy policy and will notify users of any significant changes.'),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: getMarginOrPadding(
                bottom: 20,
                horizontal: 16,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBackButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textRich(String title) {
  return Padding(
    padding: getMarginOrPadding(bottom: 20, top: 0),
    child: Text(
      title,
      style: TextStylesManager.drawerText,
      textAlign: TextAlign.center,
    ),
  );
}
