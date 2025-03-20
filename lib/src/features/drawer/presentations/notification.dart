import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/cupertino_picker.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {"time": "08:00", "enabled": true, "label": "Morning"},
    {"time": "17:00", "enabled": false, "label": "Evening"},
  ];

  void addNotification() {
    setState(() {
      notifications.add({"time": "12:00", "enabled": true, "label": "New"});
    });
  }

  void toggleNotification(int index) {
    setState(() {
      notifications[index]["enabled"] = !notifications[index]["enabled"];
    });
  }

  DateTime dateTime = DateTime(10, 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(right: 16, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/hamburger.svg',
                      width: 20.0.w,
                      height: 20.0.h,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Text(
                      'Notification',
                      style: TextStylesManager.headerMainMenu,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Padding(
                    padding: getMarginOrPadding(horizontal: 16),
                    child: Container(
                      padding: getMarginOrPadding(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: StyleManager.blocColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification["label"],
                                style: TextStylesManager.lilTitleGray,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                notification["time"],
                                style: TextStylesManager.headerMainMenu,
                              ),
                            ],
                          ),
                          CupertinoSwitch(
                            value: notification["enabled"],
                            activeColor: StyleManager.mainColor,
                            onChanged: (value) => toggleNotification(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8.h,
                  );
                },
              ),
            ),
            Padding(
              padding: getMarginOrPadding(bottom: 20, horizontal: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  PickerSettings(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
