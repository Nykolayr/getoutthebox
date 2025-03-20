import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_model.dart';

class EmotionItemChoose extends StatelessWidget {
  final EmotionModel emotion;
  final Function(EmotionModel) onTap;
  const EmotionItemChoose(
      {super.key, required this.emotion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: StyleManager.blocColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: emotion.isSelected,
            onChanged: (value) {
              onTap(emotion);
            },
          ),
          const Gap(5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(emotion.title, style: AppText.text16),
                const Gap(5),
                RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cause: ',
                        style: AppText.text14
                            .copyWith(color: StyleManager.yellowColor),
                      ),
                      TextSpan(
                        text: emotion.cause,
                        style: AppText.text14,
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Goal: ',
                          style: AppText.text14
                              .copyWith(color: StyleManager.purpleColor)),
                      TextSpan(
                        text: emotion.goal,
                        style: AppText.text14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
