import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/emotion_item_chose.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/show_modal_bottom.dart';

// void openNextBottomSheet(BuildContext context) {
//   final bloc = Get.find<EmotionBloc>();
//   showEmotionModalBottomSheet(
//     context: context,
//     title: 'Explore the triggers',
//     content: Column(
//       children: [
//         ...List.generate(
//           bloc.state.trigers.length,
//           (index) => TrigersItem(
//             title: bloc.state.trigers[index].title,
//             onTap: () {
//               bloc.add(ChangeSelectedTriger(triger: bloc.state.trigers[index]));
//               openEmotionBottomSheet(context);
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }

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
