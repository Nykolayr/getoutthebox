import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_emotion.dart';

import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/add_item.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/add_widget.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';

import '../bloc/emotion_bloc.dart';

class KeepChanging extends StatefulWidget {
  final bool isSave;
  const KeepChanging({super.key, this.isSave = false});

  @override
  State<KeepChanging> createState() => _KeepChangingfState();
}

class _KeepChangingfState extends State<KeepChanging> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();

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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: getMarginOrPadding(right: 16, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Keep on\nChanging',
                      style: TextStylesManager.headerMainMenu,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              WrapContainerRound(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Triggers:', style: AppText.text20),
                        AddWidget(onPressed: () async {
                          controller1.text =
                              state.selectedInnerWork.trigers[0].note;
                          openNoteBottomSheet(
                            context: context,
                            title: 'Comment on your trigger',
                            description: StepType.first.description,
                            type: NoteType.triger,
                            index: 0,
                            controller: controller1,
                          );
                          setState(() {});
                        }),
                      ],
                    ),
                    const Gap(15),
                    ...List.generate(
                      state.selectedInnerWork.trigers.length,
                      (index) => AddItem(
                        title: state.selectedInnerWork.trigers[index].title,
                        answer: state.selectedInnerWork.trigers[index].note,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              WrapContainerRound(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      state.selectedInnerWork.cognitive.length,
                      (index) => AddItem(
                        title: state.selectedInnerWork.cognitive[index].title,
                        answer: state.selectedInnerWork.cognitive[index].note,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              WrapContainerRound(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(15),
                    ...List.generate(
                      state.selectedInnerWork.transforms.length,
                      (index) => AddItem(
                        title: state.selectedInnerWork.transforms[index].title,
                        answer: state.selectedInnerWork.transforms[index].note,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
            ],
          ),
        );
      },
    );
  }
}
