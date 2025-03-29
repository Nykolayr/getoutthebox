import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
              const Gap(8),
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

class CustomEditButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomEditButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: StyleManager.mainColor,
        ),
        child: Padding(
          padding: getMarginOrPadding(horizontal: 16, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size: 20.sp,
                color: StyleManager.whiteColor,
              ),
              const Gap(8),
              Text(
                "Edit",
                style: TextStylesManager.standartMain
                    .copyWith(color: StyleManager.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
