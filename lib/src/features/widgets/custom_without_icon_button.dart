import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class CustomWithoutIconButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomWithoutIconButton({
    super.key,
    required this.title,
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
          padding: getMarginOrPadding(horizontal: 40, vertical: 11),
          child: Text(
            title,
            style: TextStylesManager.standartMain
                .copyWith(color: StyleManager.whiteColor),
          ),
        ),
      ),
    );
  }
}
