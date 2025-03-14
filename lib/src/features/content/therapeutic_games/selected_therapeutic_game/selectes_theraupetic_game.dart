import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_elevated_button.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';

class SelectedTherapeuticGames extends StatefulWidget {
  final TherapeuticGame game;
  const SelectedTherapeuticGames({super.key, required this.game});

  @override
  State<SelectedTherapeuticGames> createState() =>
      _SelectedTherapeuticGamesState();
}

class _SelectedTherapeuticGamesState extends State<SelectedTherapeuticGames> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<TherapeuticGameQuestion> sortNotExampleQuestions() {
    List<TherapeuticGameQuestion> notExampleQuestions = [];

    for (var i in widget.game.questions) {
      if (!i.isExample) {
        notExampleQuestions.add(i);
      }
    }
    return notExampleQuestions;
  }

  @override
  Widget build(BuildContext context) {
    List<TherapeuticGameQuestion> filteredQuestions = sortNotExampleQuestions();
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
        padding: getMarginOrPadding(
          top: 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: getMarginOrPadding(
                right: 16,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Five\nQuestions',
                        style: TextStyle(
                          fontFamily: 'regular',
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          height: 1,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: getMarginOrPadding(horizontal: 16),
              child: Text(
                'Goal: to counter distorted thoughts through step-by-step self-analysis.',
                style: TextStylesManager.headerMain.copyWith(height: 23.2 / 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: filteredQuestions.length, // Use filtered list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 31.h,
                          height: 31.h,
                          decoration: BoxDecoration(
                            color: StyleManager.mainColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStylesManager.headerMainWhite.copyWith(
                                color: StyleManager.mainColor,
                                height: 23.2 / 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            filteredQuestions[index]
                                .question, // Use filtered list
                            style: TextStylesManager.standartMain.copyWith(
                              height: 20 / 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
              ),
            ),
            CustomElevatedButton(onPressed: () {}, text: 'EXAMPLE'),
            SizedBox(
              height: 250.h,
            ),
            Container(
              padding: getMarginOrPadding(horizontal: 16),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
