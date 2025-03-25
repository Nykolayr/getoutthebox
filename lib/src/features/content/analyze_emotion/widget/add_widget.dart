import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class AddWidget extends StatelessWidget {
  final void Function() onPressed;
  const AddWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: StyleManager.whiteColor,
        ),
        child: const Row(
          children: [
            // Icon(Icons.add, size: 13),
            // Gap(5),
            Text('Make changes', style: AppText.text14),
          ],
        ),
      ),
    );
  }
}
