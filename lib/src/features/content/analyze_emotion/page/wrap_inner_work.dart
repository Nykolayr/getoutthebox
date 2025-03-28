import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/title_step.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

class WrapInnerWork extends StatefulWidget {
  final Widget content;
  final bool isFinish;
  final String title;
  final Function() onFinish;

  const WrapInnerWork({
    super.key,
    required this.content,
    required this.isFinish,
    required this.title,
    required this.onFinish,
  });

  @override
  State<WrapInnerWork> createState() => _WrapInnerWorkState();
}

class _WrapInnerWorkState extends State<WrapInnerWork> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();

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
            left: 0,
            child: Image.asset('assets/img/fon_top_keep.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/fon_bottom_keep.png'),
          ),
          Positioned(
            top: 46,
            right: 16,
            child: TitleSimple(title: widget.title),
          ),
          Positioned.fill(
            top: 140,
            right: 16,
            bottom: 100,
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
                  if (widget.isFinish)
                    CustomWithoutIconButton(
                      title: 'Finish',
                      onPressed: () {
                        widget.onFinish();
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

enum InnerWorkType {
  inProgress,
  needsReview,
  completed;

  String get title {
    switch (this) {
      case InnerWorkType.inProgress:
        return 'In progress';
      case InnerWorkType.needsReview:
        return 'Needs review';
      case InnerWorkType.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case InnerWorkType.inProgress:
        return const Color(0xFF950000);
      case InnerWorkType.needsReview:
        return const Color(0xFF007AFF);
      case InnerWorkType.completed:
        return const Color(0xFF34C759);
    }
  }

  String get description {
    switch (this) {
      case InnerWorkType.inProgress:
        return 'Write your answer — it will help with emotion and distortion analysis';
      case InnerWorkType.needsReview:
        return 'Describe how this thinking pattern shows up in your response to the trigger.';
      case InnerWorkType.completed:
        return 'Write down how you plan to apply this strategy to work with your cognitive distortions';
    }
  }
}
