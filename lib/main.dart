import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/firebase_options.dart';
import 'package:getoutofthebox/src/features/authorization/authorization_page.dart';
import 'package:getoutofthebox/src/features/authorization/authorization_repository.dart';
import 'package:getoutofthebox/src/features/authorization/bloc/authorization_bloc.dart';
import 'package:getoutofthebox/src/features/check_auth/check_auth_page.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/analyze_emotion.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/therapeutic_games.dart';
import 'package:getoutofthebox/src/features/drawer/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:getoutofthebox/src/features/drawer/bloc/report_bloc/report_bloc.dart';
import 'package:getoutofthebox/src/features/drawer/feedback_repository.dart';
import 'package:getoutofthebox/src/features/drawer/report_repository.dart';
import 'package:getoutofthebox/src/features/main_page/main_page.dart';
import 'package:getoutofthebox/src/features/password_reset/bloc/reset_password_bloc.dart';
import 'package:getoutofthebox/src/features/password_reset/password_reset_repository.dart';
import 'package:getoutofthebox/src/features/password_reset/pasword_reset_page.dart';
import 'package:getoutofthebox/src/features/registration/bloc/registration_bloc.dart';
import 'package:getoutofthebox/src/features/registration/registration_page.dart';
import 'package:getoutofthebox/src/features/registration/registration_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthorizationBloc>(
                create: (_) =>
                    AuthorizationBloc(getIt<AuthorizationRepositoryImpl>())),
            BlocProvider<RegistrationBloc>(
                create: (_) => RegistrationBloc(getIt<
                    RegistrationRepositoryImpl>())), // Регистрация AuthBloc
            BlocProvider<FeedbackBloc>(
                create: (_) =>
                    FeedbackBloc(getIt<FeedbackRepositoryImpl>())), //фидбек
            BlocProvider<ReportBloc>(
                create: (_) => ReportBloc(getIt<ReportRepositoryImpl>())),
            BlocProvider<ResetPasswordBloc>(
                create: (_) =>
                    ResetPasswordBloc(getIt<ResetPasswordRepositoryImpl>()))
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const CheckAuthPage(),
              '/authorization': (context) => const AuthorizationPage(),
              '/homepage': (context) => const MainPage(),
              '/registration': (context) => const RegistrationPage(),
              '/password_reset': (context) => const ResetPasswordPage(),
              '/therapeutic_games': (context) => const TherapeuticGames(),
              '/analyze_emotion': (context) => AnalyzeEmotion(),
            },
            theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(surfaceTintColor: Colors.transparent),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleManager.mainColor,
                  foregroundColor: StyleManager.whiteColor,
                ),
              ),
              scaffoldBackgroundColor: StyleManager.bgColor,
              fontFamily: 'regular',
            ),
          ),
        );
      },
    );
  }
}
