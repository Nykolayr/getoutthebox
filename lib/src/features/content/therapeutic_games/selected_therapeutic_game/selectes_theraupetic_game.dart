import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/app_bar.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/bottom_bar.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/question_item.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';

import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';

class SelectedTherapeuticGames extends StatefulWidget {
  final TherapeuticGame game;
  const SelectedTherapeuticGames({super.key, required this.game});

  @override
  State<SelectedTherapeuticGames> createState() =>
      _SelectedTherapeuticGamesState();
}

class _SelectedTherapeuticGamesState extends State<SelectedTherapeuticGames> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> mockQuestions = [
    'Physical reactions: What physical sensations did you experience? For example, tension in your shoulders, a racing heartbeat, dry mouth.',
    'Emotions: What emotions arose? For instance, fear, joy, anxiety',
    'Thoughts: What thoughts came to mind?',
  ];
  List<TherapeuticGameQuestion> questions = [];
  String goal =
      'The goal of the game, "Reactive Response," is to develop awareness of your reactions to various situations and learn to recognize automatic physical, emotional, and cognitive responses.';
  String description =
      'The player draws a card with a situation description. The goal is to imagine being in that situation and, as quickly as possible (within 1-2 minutes), describe three types of responses:';
  // List<TherapeuticGameQuestion> sortNotExampleQuestions() {
  //   for (var i in widget.game.questions) {
  //     if (!i.isExample) {
  //       notExampleQuestions.add(i);
  //     }
  //   }
  //   return notExampleQuestions;
  // }

  @override
  void initState() {
    super.initState();
    Logger.i('widget.game.questions: ${widget.game.questions.length}');

    /// TODO: убрать весь этот код, когда будут приходить данные с бекенда
    if (widget.game.questions.isNotEmpty) {
      questions = widget.game.questions;
    } else {
      for (int k = 0; k < mockQuestions.length; k++) {
        questions.add(TherapeuticGameQuestion(
          id: k,
          question: mockQuestions[k],
          isExample: false,
          gameId: widget.game.id,
          createdAt: DateTime.now().toIso8601String(),
        ));
      }
    }
    if (!widget.game.description.contains('Lorem ipsum dolor sit amet')) {
      description = widget.game.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBarGame(title: widget.game.title, scaffoldKey: scaffoldKey),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomBarGame(
        onNextButtonPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: getMarginOrPadding(
            top: 10,
            left: 16,
            right: 16,
            bottom: 50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Description',
                style: AppText.text20,
              ),
              Gap(10.h),
              Text(
                description,
                style: AppText.text14,
              ),
              Gap(30.h),
              ...List.generate(
                questions.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      bottom: index != questions.length - 1 ? 15.h : 0),
                  child: QuestionItem(
                    question: questions[index].question,
                    index: index,
                  ),
                ),
              ),
              Gap(20.h),
              const Text(
                'Game Objective',
                style: AppText.text20,
              ),
              Gap(10.h),
              Text(
                goal,
                style: AppText.text14,
                textAlign: TextAlign.center,
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
