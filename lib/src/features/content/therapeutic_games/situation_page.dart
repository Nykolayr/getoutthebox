import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/models/examples_card_model.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/models/situation_model.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/widgets.dart/answer_ractive.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/widgets.dart/reaction_bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/widgets.dart/situation_line.dart';
import 'package:getoutofthebox/src/features/content/wrap_page.dart';

class SituationPage extends StatelessWidget {
  final ExamplesCardsModels example;
  const SituationPage({super.key, required this.example});

  @override
  Widget build(BuildContext context) {
    List<SituationModels> situations = SituationModels.getMock();
    return WrapPage(
      title: 'Reactive\nResponse',
      onNext: () {},
      isNextButtonVisible: false,
      titleButton: '',
      isBg: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SituationLine(),
          const Gap(15),
          const Text(
            'Losing a wallet in a public place',
            style: AppText.text20,
            textAlign: TextAlign.center,
          ),
          const Text(
            'You realize you’ve lost your wallet in a busy shopping mall. Inside were money, bank cards, and important documents.',
            style: AppText.text18,
            textAlign: TextAlign.center,
          ),
          const Gap(25),
          ...List.generate(
              situations.length,
              (index) => AnswerReactive(
                    situation: situations[index],
                    reaction: (situation) async {
                      final String? result = await showReactionBottomSheet(
                        context: context,
                        title: situation.title,
                        note: situation.note,
                        hintText:
                            'For example, tension in the shoulders, rapid heartbeat, dry mouth.',
                      );
                      if (result != null) {
                        situation.note = result;
                      }
                    },
                  )),
        ],
      ),
    );
  }
}
