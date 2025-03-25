import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/bottom_sheet.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/cognitive_distortions.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/my_inner_work.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/add_item.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/add_widget.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/wrap_container_round.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_without_icon_button.dart';

import '../bloc/emotion_bloc.dart';

class KeepChanging extends StatefulWidget {
  final bool isSave;
  const KeepChanging({super.key, this.isSave = false});

  @override
  State<KeepChanging> createState() => _KeepChangingfState();
}

class _KeepChangingfState extends State<KeepChanging> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
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
      bottomNavigationBar: Padding(
        padding: getMarginOrPadding(horizontal: 16, vertical: 30),
        child: BlocBuilder<EmotionBloc, EmotionState>(
          bloc: bloc,
          builder: (context, state) {
            Logger.i('selectedInnerWork: ${state.selectedInnerWork.toJson()}');
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                CustomWithoutIconButton(
                  title: widget.isSave ? 'Save' : 'Finish',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyInnerWork()),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<EmotionBloc, EmotionState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding:
                getMarginOrPadding(top: 50, bottom: 50, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getMarginOrPadding(right: 16, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Keep on\nChanging',
                          style: TextStylesManager.headerMainMenu,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  WrapContainerRound(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Triggers:', style: AppText.text20),
                            AddWidget(onPressed: () {
                              openNextBottomSheet(context);
                            }),
                          ],
                        ),
                        const Gap(15),
                        ...List.generate(
                          state.selectedInnerWork.trigers.length,
                          (index) => AddItem(
                            title: state.selectedInnerWork.trigers[index].title,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  WrapContainerRound(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Cognitive distortions:',
                                style: AppText.text20),
                            AddWidget(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CognitiveDistortions(isBack: true)),
                              );
                            }),
                          ],
                        ),
                        const Gap(15),
                        AddItem(title: state.selectedInnerWork.experience),
                      ],
                    ),
                  ),
                  const Gap(20),
                  WrapContainerRound(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Inner Work:', style: AppText.text20),
                            AddWidget(onPressed: () {}),
                          ],
                        ),
                        const Gap(15),
                        const AddItem(title: '1. Identify Negative Thoughts'),
                        const Gap(10),
                        const AddItem(title: '2. Challenge Negative Thoughts'),
                      ],
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
