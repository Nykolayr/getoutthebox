import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/emotion_item_chose.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/show_modal_bottom.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

void openNoteBottomSheet({
  required BuildContext context,
  required String title,
  required NoteType type,
  required int index,
  required TextEditingController controller,
}) {
  final bloc = Get.find<EmotionBloc>();

  showEmotionModalBottomSheet(
    context: context,
    title: title,
    showCloseButton: false,
    content: Column(
      children: [
        TextField(
          controller: controller,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          minLines: 2,
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomWithoutIconButton(
              title: 'Close',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomWithoutIconButton(
              title: 'Save',
              onPressed: () {
                bloc.add(ChangeNote(
                  note: controller.text,
                  type: type,
                  index: index,
                ));
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    ),
  );
}

void openEmotionBottomSheet(
  BuildContext context,
) {
  final bloc = Get.find<EmotionBloc>();
  showEmotionModalBottomSheet(
    context: context,
    showBackButton: true,
    title: 'Choose your emotion',
    content: BlocBuilder<EmotionBloc, EmotionState>(
      bloc: bloc,
      builder: (context, state) {
        Logger.i(
            'state.selectedInnerWork.trigers: ${state.selectedInnerWork.trigers.length}');

        return Column(
          children: [
            ...List.generate(
              state.selectedInnerWork.trigers[state.indexTrigers].emotions
                  .length,
              (index) => EmotionItemChoose(
                key: UniqueKey(),
                emotion: state.selectedInnerWork.trigers[state.indexTrigers]
                    .emotions[index],
                onTap: (emotion) {
                  bloc.add(ChangeSelectedEmotion(emotion: emotion));
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}
