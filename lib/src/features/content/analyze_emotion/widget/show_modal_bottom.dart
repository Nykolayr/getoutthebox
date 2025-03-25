import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/styles.dart';

void showEmotionModalBottomSheet({
  required BuildContext context,
  required String title,
  required Widget content,
  bool showBackButton = false,
  bool showCloseButton = true,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                color: StyleManager.bgColor,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (showBackButton)
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      Expanded(
                        child: Text(
                          title,
                          style: showCloseButton
                              ? TextStylesManager.smallBlackTitle
                              : TextStylesManager.smallBlackTitle.copyWith(
                                  fontSize: 16.sp,
                                ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (showCloseButton)
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                  ),
                  const Gap(30),
                  content,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
