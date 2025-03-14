import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // Добавьте этот импорт для Get.snackbar
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/drawer/bloc/report_bloc/report_bloc.dart';
import 'package:getoutofthebox/src/features/drawer/widgets/report_custom_field.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({super.key});

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getMarginOrPadding(right: 16, bottom: 30),
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
                          'Report an \nissue',
                          style: TextStylesManager.headerMainMenu,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                ReportCustomTextField(
                  title: 'The reason for sending the problem report',
                  controller: reasonController,
                ),
                SizedBox(height: 20.h),
                ReportCustomTextField(
                  title: 'Description',
                  controller: descriptionController,
                ),
                const Spacer(),
                Padding(
                  padding: getMarginOrPadding(bottom: 20, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButton(),
                      // Используем BlocConsumer для отслеживания состояния и обработки событий
                      BlocConsumer<ReportBloc, ReportState>(
                        listener: (context, state) {
                          if (state is ReportFailure) {
                            // Показываем ошибку с помощью Get.snackbar
                            Get.snackbar(
                              'Error',
                              state.error,
                            );
                          }
                          if (state is ReportSuccess) {
                            Get.snackbar(
                              'Success',
                              'Your report is done',
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                            // Переходим на главную страницу после успешной отправки
                            Navigator.pushReplacementNamed(
                                context, '/homepage');
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              // Получаем данные из текстовых полей
                              final reason = reasonController.text.trim();
                              final description =
                                  descriptionController.text.trim();

                              if (reason.isEmpty || description.isEmpty) {
                                // Показываем сообщение, если поля пустые
                                Get.snackbar(
                                  'Error',
                                  'Please fill in all fields',
                                );
                                return;
                              }

                              // Отправляем событие ReportCreateEvent в Bloc
                              context.read<ReportBloc>().add(
                                    ReportCreateEvent(
                                      reason: reason,
                                      description: description,
                                    ),
                                  );
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<ReportBloc, ReportState>(
              builder: (context, state) {
                if (state is ReportInProccess) {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: StyleManager.mainColor,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
