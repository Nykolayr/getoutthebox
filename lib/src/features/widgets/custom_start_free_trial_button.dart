import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';

class CustomStartFreeTrialButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomStartFreeTrialButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 220,
        height: 42,
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: StyleManager.mainColor),
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: SvgPicture.asset(
                'assets/icons/lock2.svg',
                width: 20,
                height: 20,
              )),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Start my free trial',
                style: TextStylesManager.standartMain
                    .copyWith(color: StyleManager.whiteColor),
              )
            ],
          ),
        ));
  }
}
