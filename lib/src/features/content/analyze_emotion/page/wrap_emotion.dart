import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/cognitive_distortions.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/keep_changing.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/transform_yourself.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/title_step.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class WrapEmotion extends StatefulWidget {
  final StepType stepType;
  final Widget content;
  final bool isFinish;
  const WrapEmotion({
    super.key,
    required this.stepType,
    required this.content,
    required this.isFinish,
  });

  @override
  State<WrapEmotion> createState() => _WrapEmotionState();
}

class _WrapEmotionState extends State<WrapEmotion> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: SvgPicture.asset('assets/icons/hamburger.svg'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const CustomDrawer(),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/img/fon_top.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/img/fon_bottom.png'),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Image.asset('assets/img/fon.png'),
          ),

          /// заголовок и шаг
          Positioned(
            top: 46,
            right: 16,
            child: TitleStep(stepType: widget.stepType),
          ),
          Positioned(
            top: 180,
            right: 16,
            left: 16,
            child: widget.content,
          ),

          /// bottom navigation bar
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  CustomNextButton(
                    isFinish: widget.isFinish,
                    onPressed: () {
                      if (!widget.isFinish) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.stepType.nextPage),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum StepType {
  first,
  second,
  third;

  String get step {
    switch (this) {
      case StepType.first:
        return 'First step';
      case StepType.second:
        return 'Second step';
      case StepType.third:
        return 'Third step';
    }
  }

  String get title {
    switch (this) {
      case StepType.first:
        return 'Analyze your\nEmotions';
      case StepType.second:
        return 'Cognitive \nDistortions';
      case StepType.third:
        return 'Transform \nYourself';
    }
  }

  Widget get nextPage {
    switch (this) {
      case StepType.first:
        return const CognitiveDistortions();
      case StepType.second:
        return const TransformYourself();
      case StepType.third:
        return const KeepChanging();
    }
  }

  String get description {
    switch (this) {
      case StepType.first:
        return 'Write your answer — it will help with emotion and distortion analysis';
      case StepType.second:
        return 'Describe how this thinking pattern shows up in your response to the trigger.';
      case StepType.third:
        return 'Write down how you plan to apply this strategy to work with your cognitive distortions';
    }
  }
}
