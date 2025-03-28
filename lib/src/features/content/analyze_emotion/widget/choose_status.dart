import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';

class ChooseStatus extends StatelessWidget {
  final InnerWorkType type;
  final ValueChanged<InnerWorkType?> onChanged;
  const ChooseStatus({
    super.key,
    required this.type,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: StyleManager.bgBlockColor,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: StyleManager.bgBlockColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PopupMenuButton<InnerWorkType>(
          initialValue: type,
          onSelected: onChanged,
          offset: const Offset(0, 40),
          color: StyleManager.whiteColor,
          elevation: 4,
          itemBuilder: (context) => InnerWorkType.values.map((status) {
            return PopupMenuItem<InnerWorkType>(
              value: status,
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: status.color,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: status == type
                        ? Icon(
                            Icons.check,
                            color: status.color,
                            size: 18,
                          )
                        : null,
                  ),
                  const Gap(12),
                  Text(
                    status.title,
                    style: AppText.text14.copyWith(
                      color: status.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type.title,
                style: AppText.text14.copyWith(
                  color: type.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(4),
              const Icon(Icons.arrow_drop_down, color: StyleManager.blackColor),
            ],
          ),
        ),
      ),
    );
  }
}
