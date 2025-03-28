import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_emotion.dart';

/// заголовок и шаг
class TitleStep extends StatelessWidget {
  final StepType stepType;
  const TitleStep({super.key, required this.stepType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          stepType.title,
          style: TextStylesManager.headerMainMenu,
          textAlign: TextAlign.end,
        ),
        const Gap(6),
        Container(
          decoration: BoxDecoration(
            color: StyleManager.mainColor,
            borderRadius: BorderRadius.circular(70),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              stepType.step,
              style: TextStylesManager.littleTile,
            ),
          ),
        ),
      ],
    );
  }
}
