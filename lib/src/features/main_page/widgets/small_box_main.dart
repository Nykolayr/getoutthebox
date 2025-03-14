import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class SmallBoxMain extends StatefulWidget {
  const SmallBoxMain({
    super.key,
    this.padding = const EdgeInsets.only(left: 8),
    required this.color,
    this.icon,
    required this.forwardIcon,
    required this.title,
    required this.iconPadding,
    this.arrowPaddingFromLedft,
    required this.width,
    required this.height,
    this.smallIcon,
    required this.onPressed,
  });

  final double width;
  final double height;
  final SvgPicture? smallIcon;
  final EdgeInsets iconPadding;
  final EdgeInsets? padding;
  final Color color;
  final EdgeInsets? arrowPaddingFromLedft;
  final SvgPicture? icon;
  final SvgPicture forwardIcon;
  final String title;
  final void Function() onPressed;

  @override
  _SmallBoxMainState createState() => _SmallBoxMainState();
}

class _SmallBoxMainState extends State<SmallBoxMain> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_scale),
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(top: 16, left: 16),
              child: Text(
                widget.title,
                style: TextStylesManager.headerMainWhite,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: Padding(
                padding: widget.iconPadding,
                child: Row(
                  crossAxisAlignment: widget.smallIcon != null
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.center,
                  children: [
                    widget.smallIcon ?? const SizedBox.shrink(),
                    if (widget.icon != null) widget.icon!,
                    if (widget.icon != null) SizedBox(width: 10.w),
                    Padding(
                        padding: widget.arrowPaddingFromLedft ??
                            const EdgeInsets.all(0)),
                    Padding(
                      padding: widget.smallIcon != null
                          ? getMarginOrPadding(top: 30)
                          : getMarginOrPadding(),
                      child: widget.forwardIcon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallBoxMainBig extends StatefulWidget {
  const SmallBoxMainBig({
    super.key,
    this.padding = const EdgeInsets.only(left: 8),
    required this.color,
    this.icon,
    required this.forwardIcon,
    required this.title,
    required this.iconPadding,
    this.arrowPaddingFromLedft,
    required this.width,
    required this.height,
    this.smallIcon,
    required this.onPressed,
  });

  final double width;
  final double height;
  final SvgPicture? smallIcon;
  final EdgeInsets iconPadding;
  final EdgeInsets? padding;
  final Color color;
  final EdgeInsets? arrowPaddingFromLedft;
  final SvgPicture? icon;
  final SvgPicture forwardIcon;
  final String title;
  final void Function() onPressed;

  @override
  _SmallBoxMainBigState createState() => _SmallBoxMainBigState();
}

class _SmallBoxMainBigState extends State<SmallBoxMainBig> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed, // Исправлено
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_scale),
        width: widget.width.w,
        height: widget.height.h.clamp(50, 200), // Ограничение высоты
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Исправлено
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(top: 16, left: 16),
              child: Text(
                widget.title,
                style: TextStylesManager.headerMainWhite,
              ),
            ),
            SizedBox(height: 16.h),
            Flexible(
              child: Padding(
                padding: widget.iconPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        widget.smallIcon ?? const SizedBox.shrink(),
                        if (widget.icon != null) widget.icon!,
                        if (widget.icon != null) SizedBox(width: 10.w),
                      ],
                    ),
                    Padding(
                      padding: widget.arrowPaddingFromLedft ??
                          const EdgeInsets.all(0),
                      child: widget.forwardIcon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
