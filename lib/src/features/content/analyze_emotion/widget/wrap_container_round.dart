import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/theme.dart';

class WrapContainerRound extends StatelessWidget {
  final Widget child;
  final bool isMargin;
  const WrapContainerRound({
    super.key,
    required this.child,
    this.isMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isMargin ? 10 : 0),
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
