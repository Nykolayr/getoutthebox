import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/models/situation_model.dart';

class AnswerReactive extends StatelessWidget {
  final SituationModels situation;

  final void Function(SituationModels situation) reaction;
  const AnswerReactive({
    super.key,
    required this.reaction,
    required this.situation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          reaction(situation);
        },
        child: WrapContainerRound(
          isMargin: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(situation.title, style: AppText.text16),
                    const Gap(5),
                    Text(situation.description,
                        style: AppText.text14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: StyleManager.blackColor)),
                  ],
                ),
              ),
              const Gap(10),
              SvgPicture.asset(
                'assets/svg/edit.svg',
                colorFilter: const ColorFilter.mode(
                  StyleManager.blackColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ));
  }
}
