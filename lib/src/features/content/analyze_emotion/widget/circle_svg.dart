import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class CircleSvg extends StatelessWidget {
  final String icon;
  final bool isBegin;
  final bool isClose;

  const CircleSvg({
    super.key,
    required this.icon,
    required this.isBegin,
    this.isClose = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorBg = isClose
        ? StyleManager.bgBlockColor
        : isBegin
            ? StyleManager.mainColor
            : StyleManager.grayColor;
    final color = isClose
        ? StyleManager.blackColor
        : isBegin
            ? StyleManager.whiteColor
            : StyleManager.mainColor;
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorBg,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
