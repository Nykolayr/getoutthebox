import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class TrigersItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  const TrigersItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: StyleManager.blocColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(title, style: AppText.text16),
            ),
            const Gap(10),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: StyleManager.mainColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: SvgPicture.asset(
                'assets/icons/forward.svg',
                colorFilter: const ColorFilter.mode(
                  StyleManager.mainColor,
                  BlendMode.srcIn,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
