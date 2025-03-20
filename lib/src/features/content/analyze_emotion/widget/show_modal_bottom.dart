import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/styles.dart';

void showEmotionModalBottomSheet({
  required BuildContext context,
  required String title,
  required Widget content,
  bool showBackButton = false,
}) {
  final double screenHeight = MediaQuery.of(context).size.height;
  final double minHeight = screenHeight * 0.5;
  final double maxHeight = screenHeight * 0.9;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Делаем фон прозрачным
    constraints: BoxConstraints(
      minHeight: minHeight,
      maxHeight: maxHeight,
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              color: StyleManager.bgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                        style: TextStylesManager.smallBlackTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: content,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
