import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class WrapContainerRound extends StatelessWidget {
  final Widget child;
  const WrapContainerRound({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: StyleManager.bgBlockColor,
      ),
      child: child,
    );
  }
}
