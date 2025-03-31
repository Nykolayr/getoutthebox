import 'package:flutter/material.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/models/examples_card_model.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/situation_page.dart';
import 'package:getoutofthebox/src/features/content/wrap_page.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/models/therapeutic_games_response_model.dart';
import 'package:getoutofthebox/src/features/widgets/game_card_widget.dart';

class ExampleCards extends StatelessWidget {
  final TherapeuticGame game;
  const ExampleCards({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    List<ExamplesCardsModels> examples = ExamplesCardsModels.getMock();
    print('examples ${examples.length}');
    return WrapPage(
      title: 'Example\nCards',
      onNext: () {},
      isNextButtonVisible: false,
      titleButton: '',
      content: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 элемента в ряд
            crossAxisSpacing: 8, // горизонтальный отступ
            mainAxisSpacing: 8, // вертикальный отступ
            childAspectRatio: 1.2, // соотношение сторон карточки
          ),
          itemCount: examples.length,
          itemBuilder: (context, index) {
            return GameCardWidget(
              title: examples[index].title,
              pathImage: examples[index].pathImage,
              isFree: true,
              onPressed: () {
                // TODO: добавить блок для получения игры по id
                // bloc.add(GetTherapeuticGameById(
                //     id: games[index].id));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SituationPage(
                      example: examples[index],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
