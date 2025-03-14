import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/keep_changing.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/analyze_card_emotion.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/stars_feedback.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class TransformYourself extends StatefulWidget {
  TransformYourself({super.key});

  @override
  State<TransformYourself> createState() => _TransformYourselfState();
}

class _TransformYourselfState extends State<TransformYourself> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int score = 0;

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
                        'Transform\nYourself',
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
                            'Third step',
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
                  title: 'Step into change',
                  onPressed: () {},
                  haveAccess: true),
            ),
            Padding(
              padding: getMarginOrPadding(horizontal: 16, top: 30),
              child: Column(
                children: [
                  Text(
                    'How useful was it for you?',
                    style: TextStylesManager.smallBlackTitle,
                  ),SizedBox(height: 16.h,),
                  StarsFeedback(
                    onRatingChanged: (int rating) {
                      setState(() {
                        score = rating; // Обновляем кол-во звезд
                      });
                    },
                  ),
                ],
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
                              builder: (context) => const KeepChanging()),
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
