import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/transform_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/analyze_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';

class TransformYourself extends StatefulWidget {
  final bool isBack;
  const TransformYourself({super.key, this.isBack = false});

  @override
  State<TransformYourself> createState() => _TransformYourselfState();
}

class _TransformYourselfState extends State<TransformYourself> {
  final TextEditingController controller = TextEditingController();
  int score = 0;
  final bloc = Get.find<EmotionBloc>();
  int index = 0;
  bool isBegin = true;

  @override
  void initState() {
    super.initState();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.transforms.map((e) => e.id).toList();
    isBegin = excludedNumbers.isEmpty;
  }

  void updateTransform() {
    controller.clear();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.transforms.map((e) => e.id).toList();
    index = getRandomNumberExcluding(excludedNumbers);
    bloc.add(ChangeIndexTransform(index: index));
    score = 0;
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
            stepType: StepType.third,
            isFinish: !isBegin,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RefreshWidget(
                  isBegin: isBegin,
                  title: isBegin
                      ? 'Step into change'
                      : TransformModel.getTransforms()[index].title,
                  description: isBegin
                      ? ''
                      : TransformModel.getTransforms()[index].description,
                  onRefresh: () async {
                    if (isBegin) {
                      isBegin = false;
                      updateTransform();
                    }
                    openNoteBottomSheet(
                      context: context,
                      title: TransformModel.getTransforms()[index].title,
                      description: StepType.third.description,
                      type: NoteType.transform,
                      index: index,
                      controller: controller,
                    );
                  },
                ),
                const Gap(20),
                // StarsFeedback(
                //   rating: score,
                //   onRatingChanged: (int stars) {
                //     if (!isBegin) {
                //       setState(() {
                //         score = stars;
                //       });
                //       bloc.add(AddStars(stars: stars));
                //     }
                //   },
                // ),
              ],
            ),
          );
        });
  }
}
