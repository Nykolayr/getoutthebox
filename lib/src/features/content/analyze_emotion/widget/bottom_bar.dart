import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class BottomBarGame extends StatelessWidget {
  final bool isNextButtonVisible;
  final bool isBackButtonVisible;
  final VoidCallback onNextButtonPressed;
  const BottomBarGame({
    super.key,
    this.isNextButtonVisible = true,
    this.isBackButtonVisible = true,
    required this.onNextButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getMarginOrPadding(
        top: 10,
        left: 16,
        right: 16,
        bottom: 10,
      ),
      height: 100.h,
      color: StyleManager.bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isBackButtonVisible) const CustomBackButton(),
          if (isNextButtonVisible)
            CustomNextButton(
              onPressed: onNextButtonPressed,
            ),
        ],
      ),
    );
  }
}
