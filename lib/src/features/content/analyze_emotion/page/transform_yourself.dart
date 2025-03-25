import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/transform_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/analyze_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/keep_changing.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class TransformYourself extends StatefulWidget {
  final bool isBack;
  const TransformYourself({super.key, this.isBack = false});

  @override
  State<TransformYourself> createState() => _TransformYourselfState();
}

class _TransformYourselfState extends State<TransformYourself> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int score = 0;
  final bloc = Get.find<EmotionBloc>();
  int index = 0;
  bool isBegin = true;
  bool isFinish = false;

  @override
  void initState() {
    super.initState();
  }

  void updateTransform() {
    controller.clear();
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.transforms.map((e) => e.id).toList();
    index = getRandomNumberExcluding(excludedNumbers);
    bloc.add(ChangeIndexTransform(index: index));
    score = 0;
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
              child: RefreshWidget(
                title: isBegin
                    ? 'Transform yourself'
                    : TransformModel.getTransforms()[index].title,
                description: isBegin
                    ? ''
                    : TransformModel.getTransforms()[index].description,
                onRefresh: () async {
                  if (isFinish) {
                    return;
                  }
                  isFinish = true;
                  isBegin = false;
                  updateTransform();
                  openNoteBottomSheet(
                    context: context,
                    title: 'Your next step',
                    type: NoteType.transform,
                    index: index,
                    controller: controller,
                  );
                },
              ),
            ),
            Padding(
              padding: getMarginOrPadding(horizontal: 16, top: 30),
              child: Column(
                children: [
                  // Text(
                  //   'How useful was it for you?',
                  //   style: TextStylesManager.smallBlackTitle,
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  // StarsFeedback(
                  //   rating: score,
                  //   onRatingChanged: (int stars) {
                  //     if (!isBegin) {
                  //       setState(() {
                  //         score = stars;
                  //       });
                  //       bloc.add(AddStars(stars: stars));
                  //     }
                  //   },
                  // ),
                ],
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
