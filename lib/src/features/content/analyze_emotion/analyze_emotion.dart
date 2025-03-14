import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/cognitive_distortions.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/analyze_card_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/emotion_card_widget.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';
import 'package:getoutofthebox/src/features/widgets/game_card_widget.dart';

class AnalyzeEmotion extends StatefulWidget {
  AnalyzeEmotion({super.key});

  @override
  State<AnalyzeEmotion> createState() => _AnalyzeEmotionState();
}

class _AnalyzeEmotionState extends State<AnalyzeEmotion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> games = [
    {
      'title': '',
      'subtitle':
          'Who do you hold a grudge againt?\nWhat could make you forgive them?',
      'haveAccess': true
    },
    {
      'title': '',
      'subtitle':
          'Do you often have nightmares or\nrecurring dreams? Describe them.',
      'haveAccess': true
    },
    {
      'title': '',
      'subtitle': 'What is one thing you need to let go of?',
      'haveAccess': true
    },
    {
      'title': '',
      'subtitle': 'What is one thing you need to let go of?',
      'haveAccess': true
    },
  ];

  List<Map<String, dynamic>> emotions = [
    {"title": "Happy", "isSelected": true},
    {"title": "Sad", "isSelected": false},
    {"title": "Angry", "isSelected": false},
    {"title": "Excited", "isSelected": false},
  ];

  void openNextBottomSheet(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: StyleManager.bgColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: getMarginOrPadding(top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            'Choose your emotion',
                            style: TextStylesManager.smallBlackTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.46,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: emotions.length,
                      itemBuilder: (context, index) {
                        return EmotionCardWidget(
                          title: emotions[index]['title'],
                          isSelected: emotions[index]['isSelected'],
                          onChanged: (bool? value) {
                            setState(() {
                              emotions[index]['isSelected'] = value ?? false;
                            });
                          },
                          onPressed: () {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
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
      body: Container(
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
              child: AnalyzeCardEmotion(
                title: 'Explore the triggers',
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: StyleManager.bgColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    getMarginOrPadding(top: 20, bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Explore the triggers',
                                        style:
                                            TextStylesManager.smallBlackTitle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.46,
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: games.length,
                                  itemBuilder: (context, index) {
                                    return GameCardWidget(
                                      title: games[index]['title'],
                                      subtitle: games[index]['subtitle'],
                                      onPressed: () {
                                        openNextBottomSheet(context);
                                      },
                                      haveAccess: games[index]['haveAccess'],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(height: 10);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                haveAccess: true,
              ),
            ),
            const Spacer(),
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
                  CustomNextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CognitiveDistortions()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
