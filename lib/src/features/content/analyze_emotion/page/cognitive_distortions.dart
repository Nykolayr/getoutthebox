import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/analyze_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/expiriens_item.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';

class CognitiveDistortions extends StatefulWidget {
  final bool isBack;

  const CognitiveDistortions({super.key, this.isBack = false});

  @override
  State<CognitiveDistortions> createState() => _CognitiveDistortionsState();
}

class _CognitiveDistortionsState extends State<CognitiveDistortions> {
  final TextEditingController controller = TextEditingController();
  final bloc = Get.find<EmotionBloc>();
  int indexCognitive = 0;
  int indexExperience = 0;
  bool isBegin = true;
  @override
  void initState() {
    super.initState();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.cognitive.map((e) => e.id).toList();
    isBegin = excludedNumbers.isEmpty;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateCognitive() {
    controller.clear();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.cognitive.map((e) => e.id).toList();
    indexCognitive = getRandomNumberExcluding(excludedNumbers);
    bloc.add(ChangeIndexCognitive(index: indexCognitive));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionBloc, EmotionState>(
        bloc: bloc,
        builder: (context, state) {
          return WrapEmotion(
            stepType: StepType.second,
            isFinish: !isBegin,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RefreshWidget(
                    isBegin: isBegin,
                    title: isBegin
                        ? 'Spot the distortion'
                        : CognitiveModel.getCognitive()[indexCognitive].title,
                    description: isBegin
                        ? ''
                        : CognitiveModel.getCognitive()[indexCognitive]
                            .description,
                    onRefresh: () async {
                      if (isBegin) {
                        isBegin = false;
                        updateCognitive();
                      }
                      openNoteBottomSheet(
                        context: context,
                        title:
                            CognitiveModel.getCognitive()[indexCognitive].title,
                        description: StepType.second.description,
                        type: NoteType.cognitive,
                        index: indexCognitive,
                        controller: controller,
                      );
                    }),
                const Gap(20),
                const Text(
                  'How often you experience it on yourself?',
                  style: AppText.text20,
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    state.experience.length,
                    (index) => ExpiriensItem(
                      title: state.experience[index].title,
                      id: index,
                      onPressed: (id) {
                        indexExperience = id;
                        bloc.add(ChangeIndexCognitive(index: id));
                        setState(() {});
                      },
                      selectedId: indexExperience,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
