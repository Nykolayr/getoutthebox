import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class CircleSvg extends StatelessWidget {
  final String icon;
  final bool isBegin;

  const CircleSvg({
    super.key,
    required this.icon,
    required this.isBegin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isBegin ? StyleManager.mainColor : StyleManager.grayColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isBegin ? StyleManager.whiteColor : StyleManager.mainColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
