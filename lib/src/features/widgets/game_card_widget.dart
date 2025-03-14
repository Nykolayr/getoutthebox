import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class GameCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onPressed;
  final bool haveAccess;

  const GameCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed,
      required this.haveAccess});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: getMarginOrPadding(all: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: StyleManager.blocColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStylesManager.descriptionMainGray,
                      ),
                      Text(
                        subtitle,
                        style: TextStylesManager.standartMain
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  haveAccess
                      ? SvgPicture.asset('assets/icons/forward.svg')
                      : SvgPicture.asset('assets/icons/lock.svg')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}