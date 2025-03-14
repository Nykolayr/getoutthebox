import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/styles.dart';

class EmotionCardWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const EmotionCardWidget({
    super.key,
    required this.onPressed,
    required this.isSelected,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected), // Инвертируем состояние при нажатии
     child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
                  value: isSelected,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  activeColor: Colors.green,
                ),
            Text(
              title,
              style: TextStylesManager.standartMain
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
