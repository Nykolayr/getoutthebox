import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/my_inner_work.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';

import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

import '../bloc/emotion_bloc.dart';

class KeepChanging extends StatefulWidget {
  final bool isFinish;
  const KeepChanging({super.key, this.isFinish = true});

  @override
  State<KeepChanging> createState() => _KeepChangingfState();
}

class _KeepChangingfState extends State<KeepChanging> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();
  final List<String> innerWorks = [
    '“1. Identify Negative Thoughts”',
    '“2.“Reality Check the Thought”',
    '“3. “Consider Alternative Perspectives”',
    '“4. “Focus on What You Can Control”',
  ];

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
          isFinish: widget.isFinish,
          onFinish: () {
            bloc.add(ChangeTypeInnerWork(
                type: InnerWorkType.needsReview,
                id: bloc.state.selectedInnerWork.id));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyInnerWork()),
            );
          },
          title: 'Keep on\nChanging',
          content: SingleChildScrollView(
            child: WrapContainerRound(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Triggers:', style: AppText.text20),
                      CustomPlusButton(onPressed: () {}),

                      // AddWidget(onPressed: () async {
                      //   controller1.text =
                      //       state.selectedInnerWork.trigers[0].note;
                      //   openNoteBottomSheet(
                      //     context: context,
                      //     title: 'Comment on your trigger',
                      //     description: StepType.first.description,
                      //     type: NoteType.triger,
                      //     index: 0,
                      //     controller: controller1,
                      //   );
                      //   setState(() {});
                      // }),
                    ],
                  ),
                  const Gap(10),
                  ...List.generate(
                    state.selectedInnerWork.trigers.length,
                    (index) => Text(
                      '“${state.selectedInnerWork.trigers[index].title}”',
                      style: AppText.text16Sriracha,
                    ),
                  ),
                  const Gap(25),
                  const Text('Cognitive distortions:', style: AppText.text20),
                  const Gap(10),
                  Text('“${state.selectedInnerWork.cognitive[0].title}”',
                      style: AppText.text16Sriracha),
                  const Gap(25),
                  const Text('Inner Work:', style: AppText.text20),
                  const Gap(10),
                  ...List.generate(
                    innerWorks.length,
                    (index) =>
                        Text(innerWorks[index], style: AppText.text16Sriracha),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
