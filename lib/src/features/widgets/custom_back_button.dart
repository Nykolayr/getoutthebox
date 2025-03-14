import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: StyleManager.blocColor,
        ),
        child: Padding(
          padding: getMarginOrPadding(horizontal: 28.5, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 20.sp,
                color: Colors.black,
              ),
              SizedBox(width: 8.w),
              Text(
                "Back",
                style: TextStylesManager.drawerText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
