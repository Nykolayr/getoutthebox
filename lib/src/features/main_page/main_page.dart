// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/main_page/widgets/small_box_main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //     icon: SvgPicture.asset('assets/icons/hamburger.svg'),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width, // Drawer на всю ширину экрана
        child: CustomDrawer(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: getMarginOrPadding(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer(); // Открытие Drawer
                  },
                  icon: SvgPicture.asset('assets/icons/hamburger.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Table of \nContents',
                      style: TextStylesManager.headerMainMenu,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: getMarginOrPadding(right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SmallBoxMain(
                        onPressed: () {
                          Navigator.pushNamed(context, '/therapeutic_games');
                        },
                        width: 183.w,
                        height: 160.h,
                        color: StyleManager.mainColor,
                        title: 'Therapeutic\nGames',
                        icon: SvgPicture.asset('assets/main_page/1.svg'),
                        forwardIcon:
                            SvgPicture.asset('assets/icons/forward.svg'),
                        iconPadding: getMarginOrPadding(left: 6),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: SmallBoxMain(
                        width: 183.w,
                        height: 160.h,
                        color: Color(0xFF53A0A7),
                        title: 'Art materials\n& Affirmations',
                        icon: SvgPicture.asset(
                          'assets/main_page/1.svg',
                          color: Colors.transparent,
                        ),
                        forwardIcon:
                            SvgPicture.asset('assets/icons/forward.svg'),
                        iconPadding: getMarginOrPadding(
                          left: 6,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SmallBoxMain(
                        width: 183.w,
                        height: 160.h,
                        color: Color(0xFF5383A7),
                        title: 'Everyday\nPractice',
                        icon: SvgPicture.asset(
                          'assets/main_page/1.svg',
                          color: Colors.transparent,
                        ),
                        forwardIcon:
                            SvgPicture.asset('assets/icons/forward.svg'),
                        iconPadding: getMarginOrPadding(
                          left: 6,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: SmallBoxMain(
                        width: 183.w,
                        height: 160.h,
                        icon: SvgPicture.asset(
                          'assets/main_page/2.svg',
                          width: 93.w,
                          height: 93.h,
                        ),
                        color: Color(0xFF6053A7),
                        title: '3 step\nself-reflection',
                        forwardIcon: SvgPicture.asset(
                          'assets/icons/forward.svg',
                        ),
                        iconPadding: getMarginOrPadding(left: 16),
                        arrowPaddingFromLedft: getMarginOrPadding(left: 12),
                        onPressed: () {
                          Navigator.pushNamed(context, '/analyze_emotion');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                SmallBoxMainBig(
                  width: double.infinity,
                  height: 160.h,
                  color: StyleManager.lightPurpleColor,
                  forwardIcon: SvgPicture.asset('assets/icons/forward.svg'),
                  title: "Questionnare & Mood Tracker",
                  smallIcon: SvgPicture.asset('assets/main_page/3.svg'),
                  icon: SvgPicture.asset(
                    'assets/main_page/4.svg',
                    height: 100.h,
                  ),
                  iconPadding: getMarginOrPadding(horizontal: 16),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
