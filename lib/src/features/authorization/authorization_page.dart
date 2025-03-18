// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';
import 'package:getoutofthebox/src/features/authorization/bloc/authorization_bloc.dart';
import 'package:getoutofthebox/src/features/authorization/google_fb_auth/fb_auth.dart';
import 'package:getoutofthebox/src/features/authorization/google_fb_auth/google_auth.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleAuthService googleAuthService = GoogleAuthService();
  final FacebookAuthService facebookAuthService = FacebookAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state is AuthorizationFailed) {
            Get.snackbar('Error', state.errorMessage ?? 'Something went wrong');
          }
          if (state is AuthorizationSuccess) {
            Navigator.pushReplacementNamed(context, '/homepage');
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: getMarginOrPadding(right: 16, left: 16),
                child: Column(children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Get out of\nthe Box',
                            style: TextStylesManager.headerMainMenu,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            decoration: BoxDecoration(
                                color: StyleManager.mainColor,
                                borderRadius: BorderRadius.circular(70)),
                            child: Padding(
                              padding: getMarginOrPadding(
                                  right: 10, left: 10, top: 6, bottom: 6),
                              child: Text(
                                'in 3 steps',
                                style: TextStyle(
                                    height: 1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: StyleManager.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 50.h),
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: StyleManager.blocColor,
                      hintText: 'Password',
                      hintStyle: TextStylesManager.standartMainGray,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/password_reset');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/forgorpassword.svg',
                          color: StyleManager.grayColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Forgot password?',
                          style: TextStylesManager.descriptionMainGray,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 42.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: StyleManager.mainColor,
                        ),
                        onPressed: () {
                          context.read<AuthorizationBloc>().add(
                              AuthorizationSignInWithEmailPressedEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 20 / 16,
                              color: StyleManager.whiteColor),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 42.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: StyleManager.mainColor,
                            elevation: 0,
                            backgroundColor: StyleManager.whiteColor,
                            side: const BorderSide(
                                color: StyleManager.mainColor)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/registration');
                        },
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                              fontFamily: 'regular',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 20 / 16,
                              color: StyleManager.mainColor),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'or Sign in with',
                        style: TextStylesManager.descriptionMainGray,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final idToken =
                          await googleAuthService.signInAndGetIdToken();
                      if (idToken != '') {
                        // Navigator.pushNamed(context, '/homepage');
                      } else {
                        // Обработка ошибки
                        Get.snackbar('Error',
                            'Google sign-in failed. Please try again.');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: StyleManager.blocColor),
                      ),
                      child: Padding(
                        padding: getMarginOrPadding(
                            top: 15, bottom: 15, left: 16, right: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/google.svg'),
                            SizedBox(
                              width: 81.w,
                            ),
                            Text(
                              'Log in via Google',
                              style: TextStylesManager.standartMain,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final accessToken =
                          await facebookAuthService.signInWithFacebook();
                      if (accessToken.isNotEmpty) {
                        // Navigator.pushNamed(context, '/homepage');
                      } else {
                        Get.snackbar('Error',
                            'Facebook sign-in failed. Please try again.');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: StyleManager.blocColor),
                      ),
                      child: Padding(
                        padding: getMarginOrPadding(
                            top: 15, bottom: 15, left: 16, right: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/facebook.svg'),
                            SizedBox(
                              width: 73.w,
                            ),
                            Text(
                              'Log in via Facebook',
                              style: TextStylesManager.standartMain,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 92.h,
                  ),
                  const Text(
                    'Terms&Conditions',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: StyleManager.mainColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 16.24 / 14,
                        color: StyleManager.mainColor),
                  )
                ]),
              ),
              if (state is AuthorizationInProcess)
                Stack(
                  children: [
                    // Полупрозрачный черный слой
                    Container(
                      color: Colors.black.withOpacity(0.5), // Затемнение
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Индикатор загрузки
                    const Center(
                      child: CircularProgressIndicator(
                        color: StyleManager.mainColor,
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
