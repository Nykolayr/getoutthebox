import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';

class RefreshWidget extends StatefulWidget {
  final String title;
  final String description;
  final void Function() onRefresh;
  const RefreshWidget({
    super.key,
    required this.title,
    this.description = '',
    required this.onRefresh,
  });

  @override
  RefreshWidgetState createState() => RefreshWidgetState();
}

class RefreshWidgetState extends State<RefreshWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _controller.forward(from: 0.0);
    await Future.delayed(const Duration(seconds: 1));
    _controller.reset();
    widget.onRefresh();
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
            onTap: _onRefresh,
            child: RotationTransition(
              turns: _controller,
              child: SvgPicture.asset('assets/icons/insert.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
