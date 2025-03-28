import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static const TextStyle text14Underline = TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: StyleManager.mainColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 16.24 / 14,
      color: StyleManager.mainColor);

  static const TextStyle text28 = TextStyle(
    fontFamily: 'regular',
    color: Color(0xFF000000),
    fontWeight: FontWeight.w700,
    height: 1,
    fontSize: 28,
  );

  static const TextStyle text20 = TextStyle(
    fontFamily: 'regular',
    color: Color(0xFF000000),
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
  static const TextStyle text14 = TextStyle(
    fontFamily: 'regular',
    color: Color(0xFF000000),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static const TextStyle text16 = TextStyle(
    fontFamily: 'regular',
    height: 20 / 16,
    color: Color(0xFF000000),
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle text16Sriracha = GoogleFonts.sriracha(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: StyleManager.blackColor,
  );
}
