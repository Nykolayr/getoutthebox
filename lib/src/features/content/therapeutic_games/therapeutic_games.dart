import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/bloc/therapeutic_game_bloc.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/selected_therapeutic_game/selectes_theraupetic_game.dart';
import 'package:getoutofthebox/src/features/content/wrap_page.dart';
import 'package:getoutofthebox/src/features/widgets/custom_start_free_trial_button.dart';
import 'package:getoutofthebox/src/features/widgets/game_card_widget.dart';

class TherapeuticGames extends StatefulWidget {
  const TherapeuticGames({super.key});

  @override
  State<TherapeuticGames> createState() => _TherapeuticGamesState();
}

class _TherapeuticGamesState extends State<TherapeuticGames> {
  final bloc = Get.find<TherapeuticGameBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetTherapeuticGame());
  }

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      title: 'Therapeutic\nGames',
      onNext: () {},
      isNextButtonVisible: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<TherapeuticGameBloc, TherapeuticGameState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: StyleManager.mainColor,
                      ),
                    );
                  } else if (state.errorMessage != '') {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    final games = state.therapeuticGames;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 элемента в ряд
                        crossAxisSpacing: 8, // горизонтальный отступ
                        mainAxisSpacing: 8, // вертикальный отступ
                        childAspectRatio: 1.2, // соотношение сторон карточки
                      ),
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        return GameCardWidget(
                          title: games[index].title,
                          pathImage: games[index].category.icon,
                          isFree: games[index].isFree,
                          onPressed: () {
                            Logger.i(
                                'games[index].isFree: ${games[index].toJson()}');
                            if (games[index].isFree) {
                              // TODO: добавить блок для получения игры по id
                              // bloc.add(GetTherapeuticGameById(
                              //     id: games[index].id));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SelectedTherapeuticGames(
                                    game: games[index],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomStartFreeTrialButton(onPressed: () {}),
            ],
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
