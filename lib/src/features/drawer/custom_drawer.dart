import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/authorization/authorization_repository.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/contacts.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/feedback.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/notification.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/privacy.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/report.dart';
import 'package:getoutofthebox/src/features/drawer/presentations/subscription_screen.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: StyleManager.whiteColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Main Menu',
                    style: TextStylesManager.headerMainMenu,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: getMarginOrPadding(left: 16, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Account'),
                    DrawerText(
                      icon: SvgPicture.asset('assets/icons/star.svg'),
                      title: 'Subscription',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubscriptionScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    DrawerText(
                      icon: SvgPicture.asset(
                        'assets/icons/belly.svg',
                      ),
                      title: 'Notification',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                    ),
                    _buildSectionTitle('Support'),
                    DrawerText(
                      icon: SvgPicture.asset(
                        'assets/icons/phone.svg',
                      ),
                      title: 'Mental Health Hotlines',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactsHealth(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    DrawerText(
                        icon: SvgPicture.asset('assets/icons/report.svg'),
                        title: 'Report an issue',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReportIssue(),
                            ),
                          );
                        }),
                    _buildSectionTitle('Other'),
                    DrawerText(
                        icon: SvgPicture.asset('assets/icons/message.svg'),
                        title: 'Send feedback',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FeedbackScreen(),
                            ),
                          );
                        }),
                    SizedBox(height: 20.h),
                    DrawerText(
                      icon: SvgPicture.asset(
                        'assets/icons/rewiew.svg',
                      ),
                      title: 'Leave a review',
                    ),
                    SizedBox(height: 20.h),
                    DrawerText(
                      icon: SvgPicture.asset('assets/icons/privacy.svg'),
                      title: 'Privacy Policy, Terms & Conditions',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Privacy(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getMarginOrPadding(bottom: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  GestureDetector(
                    onTap: () async {
                      await getIt.get<AuthorizationRepositoryImpl>().logout();
                      Navigator.pushReplacementNamed(context, '/authorization');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: StyleManager.errorColor,
                      ),
                      child: Padding(
                        padding:
                            getMarginOrPadding(horizontal: 21, vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "log out",
                              style: TextStylesManager.drawerErrorText,
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.logout,
                              size: 20.sp,
                              color: StyleManager.bgColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: getMarginOrPadding(bottom: 20, top: 30),
      child: Text(
        title,
        style: TextStylesManager.smallTitle,
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  const DrawerText({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final Widget icon; // Тип изменён на Widget
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon, // Теперь это универсальный виджет
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStylesManager.drawerText,
          ),
        ],
      ),
    );
  }
}
