import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class AnalyzeCardEmotion extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool haveAccess;

  const AnalyzeCardEmotion({
    super.key,
    required this.title,
    required this.onPressed,
    required this.haveAccess,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: haveAccess
          ? onPressed
          : null, // Обрабатываем клик только если есть доступ
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
                Text(
                  title,
                  style: TextStylesManager.standartMain
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: StyleManager.mainColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: SvgPicture.asset(
                haveAccess
                    ? 'assets/icons/forward.svg'
                    : 'assets/icons/insert.svg',
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
