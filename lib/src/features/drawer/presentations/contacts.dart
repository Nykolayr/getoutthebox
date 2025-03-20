import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/contracts_line.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsHealth extends StatelessWidget {
  const ContactsHealth({super.key});

  void _callNumber(String phoneNumber) async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Не удалось открыть номер $phoneNumber';
    }
  }

  _sendEmail() {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: 'ivanov@gmail.com');
    launch(emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(right: 16, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/hamburger.svg',
                      width: 20.0,
                      height: 20.0,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  Expanded(
                    child: Text(
                      'Mental Health \nHotlines',
                      style: TextStylesManager.headerMainMenu,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            ContactsLifeline(
              title: 'Suicide & Crisis Lifeline',
              contactInfo: '1-800-545-3443',
              icon: Icons.phone_outlined,
              onTap: () => _callNumber('+18005453443'),
            ),
            SizedBox(height: 20.h),
            ContactsLifeline(
              title: 'Suicide & Crisis Lifeline',
              contactInfo: 'ivanov@gmail.com',
              icon: Icons.mail_outline,
              onTap: () => _sendEmail(),
            ),
            const Spacer(),
            Padding(
              padding: getMarginOrPadding(bottom: 20, horizontal: 16),
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
