import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class WrapContainerRound extends StatelessWidget {
  final Widget child;
  const WrapContainerRound({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32, // Ограничиваем ширину
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: StyleManager.bgBlockColor,
        ),
        child: child,
      ),
    );
  }
}
