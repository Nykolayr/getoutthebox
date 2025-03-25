import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/cognitive_distortions.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/analyze_card_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class AnalyzeEmotion extends StatefulWidget {
  final bool isBack;
  const AnalyzeEmotion({super.key, this.isBack = false});

  @override
  State<AnalyzeEmotion> createState() => _AnalyzeEmotionState();
}

class _AnalyzeEmotionState extends State<AnalyzeEmotion> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
      body: BlocBuilder<EmotionBloc, EmotionState>(
          bloc: bloc,
          builder: (context, state) {
            return Container(
              padding: getMarginOrPadding(top: 50, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getMarginOrPadding(right: 16, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Analyze your\nEmotions',
                              style: TextStylesManager.headerMainMenu,
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              decoration: BoxDecoration(
                                color: StyleManager.mainColor,
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: Padding(
                                padding: getMarginOrPadding(
                                    right: 10, left: 10, top: 6, bottom: 6),
                                child: Text(
                                  'First step',
                                  style: TextStylesManager.littleTile,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getMarginOrPadding(horizontal: 8),
                    child: RefreshWidget(
                      title: isBegin
                          ? 'Explore the triggers'
                          : TrigersModel.getTrigers()[index].title,
                      description: isBegin
                          ? ''
                          : TrigersModel.getTrigers()[index].description,
                      onRefresh: () async {
                        if (isFinish) {
                          return;
                        }
                        isFinish = true;
                        isBegin = false;
                        updateTrigers();
                        openNoteBottomSheet(
                          context: context,
                          title: 'Comment on your trigger',
                          type: NoteType.triger,
                          index: index,
                          controller: controller,
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: getMarginOrPadding(horizontal: 8),
                    child: AnalyzeCardEmotion(
                      title: 'Choose your emotion',
                      onPressed: () {
                        if (!isBegin) {
                          openEmotionBottomSheet(context);
                        }
                      },
                      haveAccess: isBegin,
                    ),
                  ),
                  const Spacer(),
                  if (!widget.isBack)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ready for the next step?',
                          style: TextStylesManager.smallBlackTitle,
                        ),
                      ],
                    ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: getMarginOrPadding(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomBackButton(),
                        if (!widget.isBack)
                          CustomNextButton(
                            onPressed: () {
                              if (!isFinish) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CognitiveDistortions()),
                              );
                            },
                          ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
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
