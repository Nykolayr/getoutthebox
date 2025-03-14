import 'package:get_it/get_it.dart';
import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/core/network/dio_client.dart';
import 'package:getoutofthebox/core/shared_prefs/shared_prefs_repo.dart';
import 'package:getoutofthebox/src/features/authorization/authorization_repository.dart';
import 'package:getoutofthebox/src/features/drawer/feedback_repository.dart';
import 'package:getoutofthebox/src/features/drawer/report_repository.dart';
import 'package:getoutofthebox/src/features/password_reset/password_reset_repository.dart';
import 'package:getoutofthebox/src/features/registration/registration_repository.dart';
import 'package:talker/talker.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Регистрация DioClient
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Регистрация ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<DioClient>()));

  // Регистрации Registaration

  getIt.registerLazySingleton<RegistrationRepositoryImpl>(
      () => RegistrationRepositoryImpl(apiService: getIt<ApiService>()));

  getIt.registerLazySingleton<AuthorizationRepositoryImpl>(
      () => AuthorizationRepositoryImpl(apiService: getIt<ApiService>()));

  //  Регистрация Report

  getIt.registerLazySingleton<ReportRepositoryImpl>(
      () => ReportRepositoryImpl(apiService: getIt<ApiService>()));

  //  Регистрация Feedback

  getIt.registerLazySingleton<FeedbackRepositoryImpl>(
      () => FeedbackRepositoryImpl(apiService: getIt<ApiService>()));
  getIt.registerLazySingleton<ResetPasswordRepositoryImpl>(
      () => ResetPasswordRepositoryImpl(apiService: getIt<ApiService>()));

  getIt.registerLazySingleton<Talker>(() => Talker());

  getIt.registerLazySingleton<SharedPrefsRepository>(
      () => SharedPrefsRepository());
}
