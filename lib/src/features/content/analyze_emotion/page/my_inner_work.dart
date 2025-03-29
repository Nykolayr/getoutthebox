import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/style_text.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_repositories.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/date_item.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

import '../bloc/emotion_bloc.dart';

class MyInnerWork extends StatefulWidget {
  const MyInnerWork({super.key});

  @override
  State<MyInnerWork> createState() => _MyInnerWorkState();
}

class _MyInnerWorkState extends State<MyInnerWork> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapInnerWork(
      type: WrapInnerWorkType.keepChangingFinish,
      onFinish: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.all(16),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    TypeSaccess.pathImage,
                    height: 200,
                  ),
                  const Gap(16),
                  Text(
                    TypeSaccess.title,
                    style: AppText.text20,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),
                  CustomWithoutIconButton(
                    title: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          },
        );
        Get.find<EmotionRepository>().changeIndexSuccess();
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/homepage',
          (route) => false,
        );
      },
      content: BlocBuilder<EmotionBloc, EmotionState>(
        bloc: bloc,
        builder: (context, state) {
          return Column(
            children: [
              Text(
                "You've worked through\n ${state.countInnerWorksCompleted} out of 33 cognitive distortions.",
                style: AppText.text20,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      bloc.state.innerWorks.length,
                      (index) => DateItem(
                        innerWork: bloc.state.innerWorks[index],
                        onRemove: () => bloc.add(
                            RemoveInnerWork(id: state.innerWorks[index].id)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

enum TypeSaccess {
  first,
  second,
  third;

  static String get pathImage {
    switch (Get.find<EmotionRepository>().indexSuccess) {
      case 1:
        return 'assets/img/success1.png';
      case 2:
        return 'assets/img/success2.png';
      case 3:
        return 'assets/img/success3.png';
    }
    return 'assets/images/success1.png';
  }

  static String get title {
    switch (Get.find<EmotionRepository>().indexSuccess) {
      case 1:
        return "I'm proud of you. Keep moving forward!";
      case 2:
        return "Great job - one more piece of the puzzle complete.";
      case 3:
        return "This work matters. You're building real change.";
    }
    return "I'm proud of you. Keep moving forward!";
  }
}
