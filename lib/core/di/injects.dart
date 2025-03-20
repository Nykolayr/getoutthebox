import 'package:dio/dio.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/dio_client.dart';
import 'package:getoutofthebox/core/network/api/token_storage.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/bloc/emotion_bloc.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_repositories.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/bloc/therapeutic_game_bloc.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/therapeutic_games_repository.dart';

/// внедряем зависимости
Future initMain() async {
  try {
    await Get.putAsync(() async {
      final tokenStorage = await TokenStorage.fromPreferences();
      return tokenStorage;
    });
  } catch (e) {
    Logger.e('Error in access_token: $e');
  }
  try {
    Get.put<DioClient>(DioClient(Dio()));
    Get.put<Api>(Api());
  } catch (e) {
    Logger.e('DioClient error = $e');
    return 'DioClient $e';
  }

  try {
    Get.put<TherapeuticGamesRepository>(TherapeuticGamesRepository());
  } catch (e) {
    Logger.e('TherapeuticGamesRepository error = $e');
  }

  try {
    Get.put<TherapeuticGameBloc>(TherapeuticGameBloc());
  } catch (e) {
    Logger.e('TherapeuticGameBloc error = $e');
  }

  try {
    Get.put<EmotionRepository>(EmotionRepository());
  } catch (e) {
    Logger.e('EmotionRepository error = $e');
  }
  try {
    Get.put<EmotionBloc>(EmotionBloc());
  } catch (e) {
    Logger.e('EmotionBloc error = $e');
  }
}
