import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class ReportCustomTextField extends StatelessWidget {
  const ReportCustomTextField({
    super.key,
    required this.title, required this.controller,
  });
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getMarginOrPadding(horizontal: 16),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: TextStylesManager.lilTitleGray,
            ),
            SizedBox(height: 6.h),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: StyleManager.blocColor,
                hintText: title,
                hintStyle: TextStylesManager.standartMainGray,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: getMarginOrPadding(
                  horizontal: 16,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
