import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/analyze_emotion.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/transform_yourself.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/expiriens_item.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/refresh_widget.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

class CognitiveDistortions extends StatefulWidget {
  final bool isBack;

  const CognitiveDistortions({super.key, this.isBack = false});

  @override
  State<CognitiveDistortions> createState() => _CognitiveDistortionsState();
}

class _CognitiveDistortionsState extends State<CognitiveDistortions> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc = Get.find<EmotionBloc>();
  int indexCognitive = 0;
  int indexExperience = 0;
  bool isBegin = true;

  @override
  void initState() {
    super.initState();
  }

  void updateCognitive() {
    List<int> excludedNumbers =
        bloc.state.selectedInnerWork.cognitive.map((e) => e.id).toList();
    indexCognitive = getRandomNumberExcluding(excludedNumbers);
    bloc.add(ChangeIndexCognitive(index: indexCognitive));
    setState(() {});
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
        padding: getMarginOrPadding(
          top: 50,
          bottom: 50,
        ),
        child: BlocBuilder<EmotionBloc, EmotionState>(
          bloc: bloc,
          builder: (context, state) {
            Logger.i('CognitiveDistortions ${state.experience.length}');
            Logger.i(
                'CognitiveDistortions ${state.experience[indexExperience].toJson()}');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getMarginOrPadding(right: 16, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Cognitive\nDistortions',
                            style: TextStylesManager.headerMainMenu,
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            decoration: BoxDecoration(
                              color: StyleManager.mainColor,
                              borderRadius: BorderRadius.circular(70),
                            ),
                            child: Padding(
                              padding: getMarginOrPadding(
                                  right: 10, left: 10, top: 6, bottom: 6),
                              child: Text(
                                'Second step',
                                style: TextStylesManager.littleTile,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getMarginOrPadding(horizontal: 8, bottom: 30),
                  child: RefreshWidget(
                    title: isBegin
                        ? 'Cognitive distortions'
                        : CognitiveModel.getCognitive()[indexCognitive].title,
                    description: isBegin
                        ? ''
                        : CognitiveModel.getCognitive()[indexCognitive]
                            .description,
                    onRefresh: () {
                      isBegin = false;
                      updateCognitive();
                    },
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'How often you experience it on \nyourself?',
                        style: TextStylesManager.smallBlackTitle,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(16),
                      Padding(
                        padding: getMarginOrPadding(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            state.experience.length,
                            (index) => ExpiriensItem(
                              key: UniqueKey(),
                              title: state.experience[index].title,
                              id: index,
                              selectedId: indexExperience,
                              onPressed: (id) {
                                indexExperience = id;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!widget.isBack)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ready for the next step?',
                        style: TextStylesManager.smallBlackTitle,
                      ),
                    ],
                  ),
                SizedBox(height: 20.h),
                Padding(
                  padding: getMarginOrPadding(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButton(),
                      if (!widget.isBack)
                        CustomNextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransformYourself()),
                            );
                          },
                        ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
