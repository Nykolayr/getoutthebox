import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleManager {
  static final StyleManager _instance = StyleManager._internal();

  StyleManager._internal();

  factory StyleManager() {
    return _instance;
  }

  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color mainColor = Color(0xFF8BA753);
  static const Color blocColor = Color(0xFFF6F5F8);
  static const Color blackColor = Color(0xFF1D1D1D);
  static const Color grayColor = Color(0xFFC5C5CE);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightPurpleColor = Color(0xFF7A53A7);
  static const Color errorColor = Color(0xFFFF2D55);
  static const Color darkGrey = Color(0xFFD1D1D6);
}

class TextStylesManager {
  static final TextStylesManager _instance = TextStylesManager._internal();
  TextStylesManager._internal();
  factory TextStylesManager() {
    return _instance;
  }
  //основные цвета
  static TextStyle headerMain = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: StyleManager.blackColor);
  static TextStyle standartMain = TextStyle(
      height: 1.25.h,
      fontFamily: 'regular',
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: StyleManager.blackColor);
  static TextStyle descriptionMain = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.w300,
      fontSize: 14.sp,
      color: StyleManager.blackColor);
  static TextStyle smallnMain = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.w300,
      fontSize: 12.sp,
      color: StyleManager.blackColor);

  //основные цвета только серые

  static TextStyle headerMainGray = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: StyleManager.grayColor);
  static TextStyle standartMainGray = TextStyle(
      height: 1.25.h,
      fontFamily: 'regular',
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: StyleManager.grayColor);
  static TextStyle descriptionMainGray = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.w300,
      fontSize: 14.sp,
      color: StyleManager.grayColor);
  static TextStyle smallnMainGray = TextStyle(
      fontFamily: 'regular',
      fontWeight: FontWeight.w300,
      fontSize: 12.sp,
      color: StyleManager.grayColor);

  static TextStyle headerMainWhite = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: Colors.white,
    height: 23.24 / 20,
  );
  static TextStyle headerMainMenu = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30.sp,
    color: Colors.black,
    height: 34.8 / 30,
  );
  static TextStyle smallTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: StyleManager.grayColor,
    height: 23.2 / 20,
  );
  static TextStyle drawerText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: StyleManager.blackColor,
    height: 20 / 16,
  );
  static TextStyle drawerErrorText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: StyleManager.bgColor,
    height: 20 / 16,
  );
  static TextStyle drawerPrice = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: StyleManager.mainColor,
    height: 23.2 / 20,
  );
  static TextStyle lilTitleGray = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: StyleManager.grayColor,
    height: 16.24 / 14,
  );
  static TextStyle littleBigGray = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: StyleManager.darkGrey,
    height: 20 / 16,
  );
  static TextStyle smallBlackTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: StyleManager.blackColor,
    height: 23.2 / 20,
  );
  static TextStyle littleTile = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: StyleManager.whiteColor,
    height: 14 / 14,
  );
}
