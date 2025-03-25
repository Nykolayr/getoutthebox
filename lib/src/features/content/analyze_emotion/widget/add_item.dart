import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class AddItem extends StatelessWidget {
  final String title;
  const AddItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: StyleManager.blackColor.withOpacity(0.06),
      ),
      child: Text(title,
          style: AppText.text16.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
