import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class SituationLine extends StatelessWidget {
  const SituationLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: StyleManager.grayColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Situation',
              style: AppText.text16.copyWith(color: StyleManager.grayColor)),
        ),
        const Expanded(
          child: Divider(
            color: StyleManager.grayColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
