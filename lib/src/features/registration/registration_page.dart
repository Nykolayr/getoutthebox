import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/registration/bloc/registration_bloc.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custom_elevated_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showPassword = true;
  bool showRepeatPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatControleer = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistarationStatenError) {
            Get.snackbar('Error', state.errorMessage ?? 'Something went wrong');
          }
          if (state is RegistarationStateSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/', // Название маршрута нового экрана
              (Route<dynamic> route) => false, // Условие удаления маршрутов
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: getMarginOrPadding(right: 16, left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 50.h),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 93.h,
                                width: 151.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Get out of\nthe Box',
                                      style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(height: 6.h),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: StyleManager.mainColor,
                                        borderRadius: BorderRadius.circular(70),
                                      ),
                                      child: Padding(
                                        padding: getMarginOrPadding(
                                            right: 10,
                                            left: 10,
                                            top: 6,
                                            bottom: 6),
                                        child: const Text(
                                          'in 3 steps',
                                          style: TextStyle(
                                            height: 1,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: StyleManager.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 16.24 / 14,
                                    color: StyleManager.grayColor),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: StyleManager.blocColor,
                                hintText: 'E mail',
                                hintStyle: TextStylesManager.standartMainGray,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          SizedBox(height: 20.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 16.24 / 14,
                                    color: StyleManager.grayColor),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            obscureText: showPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, right: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/eye.svg',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: StyleManager.blocColor,
                              hintText: 'New password',
                              hintStyle: TextStylesManager.standartMainGray,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Repeat the password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 16.24 / 14,
                                    color: StyleManager.grayColor),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            obscureText: showRepeatPassword,
                            controller: passwordRepeatControleer,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, right: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showRepeatPassword = !showRepeatPassword;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/eye.svg',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: StyleManager.blocColor,
                              hintText: 'Repeat the password',
                              hintStyle: TextStylesManager.standartMainGray,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          // TODO допилить!
                          SizedBox(
                              height:
                                  304.h), // Space between fields and buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomBackButton(),
                              CustomElevatedButton(
                                onPressed: () async {
                                  if (passwordController.text ==
                                      passwordRepeatControleer.text) {
                                    context.read<RegistrationBloc>().add(
                                        RegistrationCreateAccountEvent(
                                            email: emailController.text,
                                            password: passwordController.text));
                                  } else {
                                    Get.snackbar(
                                        'Warning', 'passwords must match');
                                  }
                                },
                                text: 'Create an account',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (state is RegistarationStateInProccess)
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
    );
  }
}
