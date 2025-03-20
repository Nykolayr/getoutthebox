import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class ExpiriensItem extends StatelessWidget {
  final String title;
  final int id;
  final int selectedId;
  final Function(int) onPressed;
  const ExpiriensItem({
    super.key,
    required this.title,
    required this.id,
    required this.onPressed,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = id == selectedId;

    return GestureDetector(
      onTap: () => onPressed(id),
      child: Column(
        children: [
          isSelected
              ? Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: StyleManager.bgBlockColor,
                        border: Border.all(
                          color: StyleManager.mainColor,
                          width: 3.3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 7,
                      right: 7,
                      bottom: 7,
                      child: Container(
                        width: 33,
                        height: 33,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: StyleManager.mainColor,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: StyleManager.bgBlockColor,
                    border: Border.all(
                      color: StyleManager.mainColor.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                ),
          const Gap(8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
