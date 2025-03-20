import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/subscription_offers.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/hamburger.svg',
                      width: 20.0,
                      height: 20.0,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Subscription',
                    style: TextStylesManager.headerMainMenu,
                  ),
                ],
              ),
            ),
            const SubscriptionOffers(
              title:
                  'First 3 days free, then billed \$49.99 annually \nCancel anytime before the trial ends to avoid charges',
              price: '\$49.99 yearly (4.16/mo)',
            ),
            SizedBox(height: 20.h),
            const SubscriptionOffers(
              title:
                  'First 3 days free, then billed \$8.99 monthly. Cancel anytime before the trial ends to avoid charges',
              price: '\$5.99 monthly',
            ),
            const Spacer(),
            Padding(
              padding: getMarginOrPadding(bottom: 20, horizontal: 16, top: 0),
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
