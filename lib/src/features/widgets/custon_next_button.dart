import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class CustomNextButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isFinish;
  const CustomNextButton({
    super.key,
    required this.onPressed,
    this.isFinish = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: isFinish ? StyleManager.mainColor : StyleManager.grayColor,
        ),
        child: Padding(
          padding: getMarginOrPadding(horizontal: 28.5, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Next",
                style: TextStylesManager.standartMain
                    .copyWith(color: StyleManager.whiteColor),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward,
                size: 20.sp,
                color: StyleManager.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
