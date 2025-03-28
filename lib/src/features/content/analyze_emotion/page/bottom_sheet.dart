import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/emotion_item_chose.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/show_modal_bottom.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

void openNoteBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
  required NoteType type,
  required int index,
  required TextEditingController controller,
}) {
  final bloc = Get.find<EmotionBloc>();

  showEmotionModalBottomSheet(
    context: context,
    title: title,
    showCloseButton: true,
    content: Column(
      children: [
        TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Write',
            hintStyle: AppText.text14.copyWith(
              color: StyleManager.grayColor,
            ),
            fillColor: StyleManager.bgBlockColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: StyleManager.bgBlockColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: StyleManager.bgBlockColor,
              ),
            ),
          ),
          minLines: 2,
        ),
        const Gap(10),
        Text(
          description,
          style: AppText.text14.copyWith(
            color: StyleManager.grayColor,
          ),
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomWithoutIconButton(
            //   title: 'Close',
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
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
        return Column(
          children: [
            Text(
              '${state.countEmotions} of your emotions are selected out of 3',
              style: AppText.text14.copyWith(
                color: StyleManager.grayColor,
              ),
            ),
            const Gap(10),
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
