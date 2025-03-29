import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/transform_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/text_edit_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';
import '../bloc/emotion_bloc.dart';

class KeepChangingEdit extends StatefulWidget {
  const KeepChangingEdit({super.key});

  @override
  State<KeepChangingEdit> createState() => _KeepChangingEditState();
}

class _KeepChangingEditState extends State<KeepChangingEdit> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();
  List<String> emotions = [];
  TrigersModel selectedTrigers = TrigersModel.initial();
  CognitiveModel selectedCognitive = CognitiveModel.initial();
  TransformModel selectedTransform = TransformModel.initial();

  @override
  void initState() {
    super.initState();
    selectedTrigers = bloc.state.selectedInnerWork.trigers.last;
    emotions = selectedTrigers.emotions
        .where((e) => e.isSelected == true)
        .map((e) => e.title)
        .toList();
    controller1.text = selectedTrigers.note;
    Logger.i(
        'selectedCognitive: ${bloc.state.selectedInnerWork.cognitive.length}');
    selectedCognitive = bloc.state.selectedInnerWork.cognitive.last;
    Logger.i('selectedCognitive: ${selectedCognitive.toJson()}');
    controller2.text = selectedCognitive.note;
    selectedTransform = bloc.state.selectedInnerWork.transforms.last;
    controller3.text = selectedTransform.note;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionBloc, EmotionState>(
      bloc: bloc,
      builder: (context, state) {
        return WrapInnerWork(
          type: WrapInnerWorkType.keepChangingEdit,
          onFinish: () {
            bloc.add(ChangeNote(
              note: controller1.text,
              type: NoteType.triger,
              index: bloc.state.selectedInnerWork.trigers.length - 1,
            ));
            bloc.add(ChangeNote(
              note: controller2.text,
              type: NoteType.cognitive,
              index: bloc.state.selectedInnerWork.cognitive.length - 1,
            ));
            bloc.add(ChangeNote(
              note: controller3.text,
              type: NoteType.transform,
              index: bloc.state.selectedInnerWork.transforms.length - 1,
            ));
            Navigator.pop(context);
          },
          content: SingleChildScrollView(
            child: Column(
              children: [
                WrapContainerRound(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Triggers:', style: AppText.text20),
                      const Gap(5),
                      Text('“${selectedTrigers.title}”',
                          style: AppText.text16Sriracha),
                      const Gap(10),
                      const Text('Choose emotions:', style: AppText.text16),
                      const Gap(5),
                      ...List.generate(
                        emotions.length,
                        (index) => Text(
                          '“${emotions[index]}”',
                          style: AppText.text16Sriracha,
                        ),
                      ),
                      const Gap(10),
                      const Text('Note:', style: AppText.text16),
                      const Gap(5),
                      TextEditEmotion(controller: controller1, isEdit: true),
                    ],
                  ),
                ),
                const Gap(15),
                WrapContainerRound(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cognitive distortions:',
                          style: AppText.text20),
                      const Gap(10),
                      Text('“${selectedCognitive.title}”',
                          style: AppText.text16Sriracha),
                      const Gap(10),
                      const Text('Choose experience:', style: AppText.text16),
                      const Gap(5),
                      Text('“${selectedCognitive.experience.title}”',
                          style: AppText.text16Sriracha),
                      const Gap(10),
                      const Text('Note:', style: AppText.text16),
                      const Gap(5),
                      TextEditEmotion(controller: controller2, isEdit: true),
                    ],
                  ),
                ),
                const Gap(15),
                WrapContainerRound(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Transformations:', style: AppText.text20),
                      const Gap(10),
                      Text('“${selectedTransform.title}”',
                          style: AppText.text16Sriracha),
                      const Gap(10),
                      const Text('Note:', style: AppText.text16),
                      const Gap(5),
                      TextEditEmotion(controller: controller3, isEdit: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
