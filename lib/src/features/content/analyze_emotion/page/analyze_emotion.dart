import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/analyze_card_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';

class AnalyzeEmotion extends StatefulWidget {
  const AnalyzeEmotion({super.key});

  @override
  State<AnalyzeEmotion> createState() => _AnalyzeEmotionState();
}

class _AnalyzeEmotionState extends State<AnalyzeEmotion> {
  final TextEditingController controller = TextEditingController();
  final bloc = Get.find<EmotionBloc>();
  bool isBegin = true;
  bool isFinish = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(GetEmotions());
    bloc.add(GetTrigers());
    // updateTrigers();
  }

  void updateTrigers() {
    controller.clear();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.trigers.map((e) => e.id).toList();
    index = getRandomNumberExcluding(excludedNumbers);
    bloc.add(ChangeIndexTrigers(index: index));
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionBloc, EmotionState>(
      bloc: bloc,
      builder: (context, state) {
        return WrapEmotion(
          stepType: StepType.first,
          isFinish: isFinish && state.countEmotions > 0,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Answer the question to identify your emotional trigger. Then select the emotions you experience in this situation — this is essential for further analysis.',
                style: AppText.text16,
                textAlign: TextAlign.center,
              ),
              const Gap(15),
              Text(
                'Comment on your trigger',
                style: AppText.text14.copyWith(
                    fontWeight: FontWeight.w500, color: StyleManager.grayColor),
                textAlign: TextAlign.center,
              ),
              RefreshWidget(
                title: isBegin
                    ? 'Explore the triggers'
                    : TrigersModel.getTrigers()[index].title,
                description:
                    isBegin ? '' : TrigersModel.getTrigers()[index].description,
                isBegin: isBegin,
                onRefresh: () async {
                  if (isBegin) {
                    isFinish = true;
                    isBegin = false;
                    updateTrigers();
                    openNoteBottomSheet(
                      context: context,
                      title: TrigersModel.getTrigers()[index].title,
                      description: StepType.first.description,
                      type: NoteType.triger,
                      index: index,
                      controller: controller,
                    );
                  } else {
                    openNoteBottomSheet(
                      context: context,
                      title: TrigersModel.getTrigers()[index].title,
                      description: StepType.first.description,
                      type: NoteType.triger,
                      index: index,
                      controller: controller,
                    );
                  }
                },
              ),
              const Gap(10),
              AnalyzeCardEmotion(
                title: 'Choose your emotion',
                isBegin: isBegin,
                onPressed: () {
                  if (!isBegin) {
                    openEmotionBottomSheet(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// случайное число, не включая в список исключенных чисел
int getRandomNumberExcluding(List<int> excludedNumbers) {
  Random random = Random();
  List<int> availableNumbers = List.generate(33, (index) => index)
    ..removeWhere((number) => excludedNumbers.contains(number));

  if (availableNumbers.isEmpty) {
    throw Exception("Нет доступных чисел для выбора");
  }

  return availableNumbers[random.nextInt(availableNumbers.length)];
}
