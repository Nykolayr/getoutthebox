import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/text_edit_emotion.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

Future<String?> showReactionBottomSheet({
  required BuildContext context,
  String title = '',
  String hintText = '',
  String note = '',
}) async {
  final TextEditingController controller = TextEditingController(text: note);

  return await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppText.text18,
              ),
              const Gap(15),
              TextEditEmotion(
                controller: controller,
                hint:
                    'For example, tension in the shoulders, rapid heartbeat, dry mouth.',
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(10),
                  CustomWithoutIconButton(
                    title: 'Save',
                    onPressed: () {
                      Navigator.pop(context, controller.text);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
