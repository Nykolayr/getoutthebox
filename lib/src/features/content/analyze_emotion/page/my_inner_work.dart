import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/style_text.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/date_item.dart';

import '../bloc/emotion_bloc.dart';

class MyInnerWork extends StatefulWidget {
  const MyInnerWork({super.key});

  @override
  State<MyInnerWork> createState() => _MyInnerWorkState();
}

class _MyInnerWorkState extends State<MyInnerWork> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EmotionBloc bloc = Get.find<EmotionBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapInnerWork(
      title: 'My Inner\nWork',
      isFinish: true,
      onFinish: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/homepage',
          (route) => false,
        );
      },
      content: Column(
        children: [
          Text(
            "You've worked through\n ${bloc.state.innerWorks.length} out of 33 cognitive distortions.",
            style: AppText.text20,
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  bloc.state.innerWorks.length,
                  (index) => DateItem(
                    innerWork: bloc.state.innerWorks[index],
                    onRemove: () => bloc.add(
                        RemoveInnerWork(id: bloc.state.innerWorks[index].id)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
