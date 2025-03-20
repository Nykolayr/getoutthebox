import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_model.dart';

/// Репозиторий для списка терапевтических игр
class EmotionRepository {
  static EmotionRepository? _instance;
  late final Api apiService;
  List<EmotionModel> emotions = [];
  List<EmotionGamesModel> emotionGames = [];
  EmotionModel emotion = EmotionModel.initial();
  List<String> experience = [
    'Never',
    'Rarely',
    'Sometimes',
    'Often',
    'Constantly',
  ];
  // Приватный конструктор
  EmotionRepository._() {
    apiService = Get.find<Api>();
  }

  // Фабричный метод для получения экземпляра
  factory EmotionRepository() {
    _instance ??= EmotionRepository._();
    return _instance!;
  }

  // Метод для получения существующего экземпляра
  static EmotionRepository get instance {
    _instance ??= EmotionRepository._();
    return _instance!;
  }

  /// Изменение выбранной эмоции
  void changeSelectedEmotion(int id) {
    int index = emotions.indexWhere((element) => element.id == id);
    emotions[index] =
        emotions[index].copyWith(isSelected: !emotions[index].isSelected);
  }

  /// Получение списка игр по эмоции
  Future<String> getEmotionGames() async {
    emotionGames.clear();
    try {
      final response = await apiService.getEmotionGamesApi();
      if (response is ResSuccess) {
        Logger.i('response: ${response.data}');
        emotionGames = (response.data as List)
            .map((game) => EmotionGamesModel.fromJson(game))
            .toList()
            .cast<EmotionGamesModel>();

        return '';
      } else if (response is ResError) {
        return response.errorMessage;
      }
    } catch (e) {
      Logger.e('Ошибка при получении списка игр по эмоции: $e');
      return 'Ошибка при получении списка игр по эмоции $e';
    }
    return '';
  }

  /// Получение списка эмоций
  Future<String> getEmotions() async {
    emotions.clear();
    try {
      final response = await apiService.getEmotionsApi();
      if (response is ResSuccess) {
        Logger.i('response: ${response.data.length}');
        // emotions = (response.data as List)
        //     .map((game) => EmotionModel.fromJson(game))
        //     .toList()
        //     .cast<EmotionModel>();
        emotions.add(EmotionModel(
          id: 1,
          title: 'Anger',
          image: '',
          description: '',
          cause: 'Violation of boundaries',
          goal: 'To stop suffering, a drive for action',
          isSelected: false,
        ));
        emotions.add(EmotionModel(
          id: 2,
          title: 'Sadness',
          image: '',
          description: '',
          cause: 'Dissatisfaction with the current state',
          goal: 'To pause and listen to oneself',
          isSelected: false,
        ));
        emotions.add(EmotionModel(
          id: 3,
          title: 'Envy',
          image: '',
          description: '',
          cause: 'Presence of limiting beliefs and cognitive distortions',
          goal:
              'To analyze limitations and opportunities, a drive to find resources',
          isSelected: false,
        ));
        emotions.add(EmotionModel(
          id: 4,
          title: 'Guilt',
          image: '',
          description: '',
          cause: 'Dissatisfaction with a decision made',
          goal: 'To regulate social relationships',
          isSelected: false,
        ));
        emotions.add(EmotionModel(
          id: 5,
          title: 'Shame',
          image: '',
          description: '',
          cause: 'Dissatisfaction with a decision made',
          goal: 'To regulate the relationship with oneself',
          isSelected: false,
        ));
        emotions.add(EmotionModel(
          id: 6,
          title: 'Fear',
          image: '',
          description: '',
          cause: 'Lack of resources or information',
          goal: 'To provide a warning',
          isSelected: false,
        ));
        return '';
      } else if (response is ResError) {
        return response.errorMessage;
      }
    } catch (e) {
      Logger.e('Ошибка при получении списка эмоций: $e');
      return 'Ошибка при получении списка эмоций $e';
    }
    return '';
  }
}
