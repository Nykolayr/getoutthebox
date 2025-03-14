import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class PickerSettings extends StatefulWidget {
  const PickerSettings({super.key});

  @override
  State<PickerSettings> createState() => _PickerSettingsState();
}

class _PickerSettingsState extends State<PickerSettings> {
  DateTime dateTime = DateTime(10, 20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getMarginOrPadding(
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Notification Settings',
                              style: TextStylesManager.smallBlackTitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getMarginOrPadding(
                          horizontal: 8, bottom: 20, top: 30),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: StyleManager.blocColor,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: SizedBox(
                              height: 140,
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  initialDateTime: dateTime,
                                  use24hFormat: true,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => dateTime = newTime);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getMarginOrPadding(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: StyleManager.blocColor,
                        ),
                        child: Padding(
                          padding:
                              getMarginOrPadding(horizontal: 16, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Repeat",
                                style: TextStylesManager.littleBigGray,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text('data'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: getMarginOrPadding(horizontal: 16),
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: StyleManager.blocColor,
                                ),
                                child: Padding(
                                  padding: getMarginOrPadding(
                                      horizontal: 28.5, vertical: 11),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete_outline_outlined,
                                        size: 20.sp,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        "Delete",
                                        style: TextStylesManager.drawerText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: StyleManager.mainColor,
                                ),
                                child: Padding(
                                  padding: getMarginOrPadding(
                                      horizontal: 63, vertical: 11),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 8.w),
                                      Text(
                                        "Save",
                                        style:
                                            TextStylesManager.drawerErrorText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: StyleManager.mainColor,
        ),
        child: Padding(
          padding: getMarginOrPadding(horizontal: 20, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add a notification",
                style: TextStylesManager.drawerErrorText,
              ),
              Icon(
                Icons.add,
                size: 20.sp,
                color: StyleManager.bgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
