import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/circle_svg.dart';

void showEmotionModalBottomSheet({
  required BuildContext context,
  required String title,
  required Widget content,
  String description = '',
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
                        child: Column(
                          children: [
                            Text(
                              title,
                              style: TextStylesManager.smallBlackTitle,
                              textAlign: TextAlign.left,
                            ),
                            if (description.isNotEmpty) ...[
                              const Gap(5),
                              Text(description, style: AppText.text14),
                            ],
                          ],
                        ),
                      ),
                      if (showCloseButton) ...[
                        const Gap(15),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const CircleSvg(
                            icon: 'assets/svg/close.svg',
                            isBegin: false,
                            isClose: true,
                          ),
                        ),
                      ],
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
