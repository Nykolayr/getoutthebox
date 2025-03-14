import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/stars_feedback.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

import '../widgets/report_custom_field.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int score = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<FeedbackBloc, FeedbackState>(
          listener: (context, state) {
            if (state is FeedbackError) {
              // Показываем ошибку с помощью Get.snackbar
              Get.snackbar(
                'Error',
                state.erorr ?? 'Something went wrong',
              );
            }
            if (state is FeedbackSuccess) {
              Get.snackbar(
                'Success',
                'Your report is done',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              // Переходим на главную страницу после успешной отправки
              Navigator.pushReplacementNamed(context, '/homepage');
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getMarginOrPadding(right: 16, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/hamburger.svg',
                              width: 20.0.w,
                              height: 20.0.h,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Expanded(
                            child: Text(
                              'Send feedback',
                              style: TextStylesManager.headerMainMenu,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60.h),
                    SizedBox(
                      height: 168.h,
                      child: Column(
                        children: [
                          Text(
                            'Feedback',
                            style: TextStylesManager.smallBlackTitle,
                          ),
                          SizedBox(height: 17.h),
                          Padding(
                            padding: getMarginOrPadding(horizontal: 16),
                            child: StarsFeedback(
                              onRatingChanged: (int rating) {
                                setState(() {
                                  score = rating; // Обновляем кол-во звезд
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          ReportCustomTextField(
                            title: 'Description',
                            controller: commentController,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: getMarginOrPadding(bottom: 20, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomBackButton(),
                          GestureDetector(
                            onTap: () {
                              context.read<FeedbackBloc>().add(
                                  FeedbackCreateEvent(
                                      comment: commentController.text,
                                      rating: score));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: StyleManager.mainColor,
                              ),
                              child: Padding(
                                padding: getMarginOrPadding(
                                    horizontal: 62.5, vertical: 11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Send",
                                      style: TextStylesManager.drawerErrorText,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (state is FeedbackInProccess)
                  const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: StyleManager.mainColor,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
