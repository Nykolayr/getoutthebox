import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class TextEditEmotion extends StatelessWidget {
  final TextEditingController controller;
  final bool isEdit;
  const TextEditEmotion({
    super.key,
    required this.controller,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Write',
        hintStyle: AppText.text14.copyWith(
          color: StyleManager.grayColor,
        ),
        fillColor: isEdit ? StyleManager.whiteColor : StyleManager.bgBlockColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: StyleManager.bgBlockColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: StyleManager.bgBlockColor,
          ),
        ),
      ),
      minLines: 2,
    );
  }
}
