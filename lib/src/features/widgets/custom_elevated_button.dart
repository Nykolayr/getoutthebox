import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      height: 42.h,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: StyleManager.mainColor),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStylesManager.standartMain
                    .copyWith(color: StyleManager.whiteColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
