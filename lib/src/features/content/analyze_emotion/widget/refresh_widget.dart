import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/circle_svg.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';

class RefreshWidget extends StatefulWidget {
  final String title;
  final String description;
  final bool isBegin;
  final void Function() onRefresh;
  const RefreshWidget({
    super.key,
    required this.title,
    this.description = '',
    required this.onRefresh,
    required this.isBegin,
  });

  @override
  RefreshWidgetState createState() => RefreshWidgetState();
}

class RefreshWidgetState extends State<RefreshWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onRefresh() async {
    if (widget.isBegin) {
      controller.forward(from: 0.0);
      await Future.delayed(const Duration(seconds: 1));
      controller.reset();
      widget.onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WrapContainerRound(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.title, style: AppText.text16),
                if (widget.description.isNotEmpty) ...[
                  const Gap(5),
                  Text(widget.description,
                      style:
                          AppText.text14.copyWith(fontWeight: FontWeight.w400)),
                ],
              ],
            ),
          ),
          const Gap(10),
          GestureDetector(
            onTap: widget.isBegin ? onRefresh : widget.onRefresh,
            child: RotationTransition(
              turns: controller,
              child: CircleSvg(
                icon: widget.isBegin
                    ? 'assets/svg/refresh.svg'
                    : 'assets/svg/edit.svg',
                isBegin: widget.isBegin,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
