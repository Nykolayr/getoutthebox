import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/bloc/therapeutic_game_bloc.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/selected_therapeutic_game/selectes_theraupetic_game.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_start_free_trial_button.dart';
import 'package:getoutofthebox/src/features/widgets/game_card_widget.dart';

class TherapeuticGames extends StatefulWidget {
  const TherapeuticGames({super.key});

  @override
  State<TherapeuticGames> createState() => _TherapeuticGamesState();
}

class _TherapeuticGamesState extends State<TherapeuticGames> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc = Get.find<TherapeuticGameBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetTherapeuticGame());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: SvgPicture.asset('assets/icons/hamburger.svg'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const CustomDrawer(),
      ),
      body: Container(
        padding: getMarginOrPadding(top: 50, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getMarginOrPadding(right: 16, bottom: 30),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Therapeutic\nGames',
                        style: TextStyle(
                          fontFamily: 'regular',
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          height: 1,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 30.h),
            Expanded(
              child: Container(
                padding: getMarginOrPadding(horizontal: 8),
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
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: games.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (games[index].isFree) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedTherapeuticGames(
                                              game: games[index],
                                            )));
                              }
                            },
                            child: GameCardWidget(
                              title: 'Games',
                              subtitle: games[index].title,
                              onPressed: () {
                                if (games[index].isFree) {
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
                              haveAccess: games[index].isFree,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomStartFreeTrialButton(onPressed: () {}),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: getMarginOrPadding(horizontal: 16),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
