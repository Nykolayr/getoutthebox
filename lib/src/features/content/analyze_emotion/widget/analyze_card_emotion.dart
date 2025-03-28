import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/circle_svg.dart';

class AnalyzeCardEmotion extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool isBegin;
  const AnalyzeCardEmotion({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isBegin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isBegin ? null : onPressed,
      child: Container(
        padding: getMarginOrPadding(all: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: StyleManager.blocColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.text16),
              ],
            ),
            Transform.rotate(
              angle: -0.7854, // 45 degrees in radians
              child: CircleSvg(
                icon: 'assets/icons/arrow.svg',
                isBegin: !isBegin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
