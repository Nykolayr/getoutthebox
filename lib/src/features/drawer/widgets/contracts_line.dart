import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class ContactsLifeline extends StatelessWidget {
  const ContactsLifeline({
    super.key,
    required this.title,
    required this.contactInfo,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String contactInfo;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getMarginOrPadding(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: StyleManager.blocColor,
          ),
          child: Padding(
            padding: getMarginOrPadding(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStylesManager.drawerText,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(icon, color: StyleManager.mainColor),
                    SizedBox(width: 10.w),
                    Text(
                      contactInfo,
                      style: TextStylesManager.drawerText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
