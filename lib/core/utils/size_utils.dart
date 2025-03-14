import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets getMarginOrPadding({
  double? all,
  double? horizontal,
  double? vertical,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all.w;
    top = all.w;
    right = all.w;
    bottom = all.w;
  } else {
    if (horizontal != null) {
      left = horizontal.w;
      right = horizontal.w;
    }
    if (vertical != null) {
      top = vertical.h;
      bottom = vertical.h;
    }
  }

  return EdgeInsets.only(
    left: left?.w ?? 0,
    top: top?.h ?? 0,
    right: right?.w ?? 0,
    bottom: bottom?.h ?? 0,
  );
}
