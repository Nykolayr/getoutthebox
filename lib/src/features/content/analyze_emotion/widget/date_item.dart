import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/theme.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/in_work_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/keep_changing.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/choose_status.dart';

import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  final InWorkModel innerWork;
  final VoidCallback onRemove;
  const DateItem({super.key, required this.innerWork, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<EmotionBloc>();
    return GestureDetector(
      onTap: () {
        Get.find<EmotionBloc>()
            .add(ChangeSelectedInnerWork(innerWork: innerWork));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const KeepChanging(
                    isFinish: false,
                  )),
        );
      },
      child: BlocBuilder<EmotionBloc, EmotionState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            decoration: BoxDecoration(
              color: StyleManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: StyleManager.grayColor),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat('MMMM d,yyyy').format(innerWork.date),
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' • ',
                          style: AppText.text16.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: StyleManager.grayColor,
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(innerWork.date),
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: StyleManager.grayColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(5),
                        color: Colors.transparent,
                        child: SvgPicture.asset('assets/icons/trash.svg'),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    Text(
                      'Status:',
                      style: AppText.text16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: StyleManager.grayColor),
                    ),
                    const Gap(10),
                    ChooseStatus(
                      key: UniqueKey(),
                      type: innerWork.type,
                      onChanged: (value) {
                        bloc.add(ChangeTypeInnerWork(
                            type: value!, id: innerWork.id));
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
