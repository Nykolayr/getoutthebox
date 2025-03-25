import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/date_item.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

import '../bloc/emotion_bloc.dart';

class MyInnerWork extends StatefulWidget {
  const MyInnerWork({super.key});

  @override
  State<MyInnerWork> createState() => _MyInnerWorkState();
}

class _MyInnerWorkState extends State<MyInnerWork> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = EmotionBloc();
  int score = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
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
      bottomNavigationBar: Padding(
        padding: getMarginOrPadding(horizontal: 16, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            CustomWithoutIconButton(
              title: 'Finish',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/homepage',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<EmotionBloc, EmotionState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding:
                getMarginOrPadding(top: 50, bottom: 50, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getMarginOrPadding(right: 16, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'My Inner\nWork',
                          style: TextStylesManager.headerMainMenu,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  ...state.innerWorks.map((e) => DateItem(
                      innerWork: e,
                      onRemove: () => bloc.add(RemoveInnerWork(id: e.id)))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
