import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class QuestionItem extends StatelessWidget {
  final String question;
  final int index;
  const QuestionItem({super.key, required this.question, required this.index});

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: question,
      style: AppText.text16,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 10, // Максимальное количество строк для подсчета
    );
    textPainter.layout(
        maxWidth: MediaQuery.of(context).size.width -
            50); // Примерная ширина с учетом отступов
    final lines = textPainter.computeLineMetrics().length;
    return Row(
      crossAxisAlignment:
          lines <= 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            color: StyleManager.mainColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStylesManager.headerMainWhite.copyWith(
                color: StyleManager.mainColor,
                height: 23.2 / 20,
              ),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Text(
            question,
            style: AppText.text16,
          ),
        ),
      ],
    );
  }
}
