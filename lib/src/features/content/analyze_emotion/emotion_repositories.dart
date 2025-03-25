import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/cognitive_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/experience_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/in_work_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

/// Репозиторий для списка терапевтических игр
class EmotionRepository {
  static EmotionRepository? _instance;
  late final Api apiService;
  List<EmotionGamesModel> emotionGames = [];
  List<InWorkModel> inWorks = [];
  InWorkModel selectedInnerWork = InWorkModel.init(0);

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

  /// изменение inWorks
  void updateSelectedInnerWork() {
    final index = inWorks.indexWhere((e) => e.id == selectedInnerWork.id);
    if (index != -1) {
      inWorks[index] = selectedInnerWork;
    }
  }

  /// Изменение выбранного посещения
  void changeSelectedInnerWork(InWorkModel innerWork) {
    selectedInnerWork = innerWork;
  }

  /// Добавление звезды
  void addStars(int stars, int index) {
    selectedInnerWork.transforms[index].rate = stars;
    updateSelectedInnerWork();
  }

  /// Изменение выбранного опыта
  void changeSelectedExperience(ExperienceModel experience) {
    if (selectedInnerWork.cognitive.any((e) => e.id == experience.id)) {
      selectedInnerWork.cognitive
          .firstWhere((e) => e.id == experience.id)
          .experience = experience;
    }
    updateSelectedInnerWork();
  }

  /// добавление выбранного тригера
  void changeSelectedTriger(TrigersModel triger) {
    if (selectedInnerWork.trigers.any((e) => e.id == triger.id)) {
      selectedInnerWork.trigers.add(triger);
    }
    updateSelectedInnerWork();
  }

  /// Добавление cognitive
  void addCognitive(CognitiveModel cognitive) {
    if (selectedInnerWork.cognitive.any((e) => e.id == cognitive.id)) {
      selectedInnerWork.cognitive.add(cognitive);
    }
    updateSelectedInnerWork();
  }

  /// Удаление посещения
  void removeInWork(int id) {
    inWorks.removeWhere((element) => element.id == id);
  }

  /// Добавление нового посещения
  void addInWork() {
    inWorks.add(InWorkModel.init(inWorks.length + 1));
    selectedInnerWork = inWorks.last;
  }

  /// Изменение выбранной эмоции
  void changeSelectedEmotion(EmotionModel emotion, int id) {
    int indexTriger =
        selectedInnerWork.trigers.indexWhere((element) => element.id == id);
    int indexEmotion = selectedInnerWork.trigers[indexTriger].emotions
        .indexWhere((element) => element.id == emotion.id);
    selectedInnerWork.trigers[indexTriger].emotions[indexEmotion] =
        emotion.copyWith(
            isSelected: !selectedInnerWork
                .trigers[indexTriger].emotions[indexEmotion].isSelected);
  }

  /// Получение списка триггеров
  Future<String> getTrigers() async {
    try {
      final response = await apiService.getTrigersApi();
      if (response is ResSuccess) {
        Logger.i('getTrigers: ${response.data}');
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

  /// Получение списка игр по эмоции
  Future<String> getEmotionGames() async {
    emotionGames.clear();
    try {
      final response = await apiService.getEmotionGamesApi();
      if (response is ResSuccess) {
        Logger.i('getEmotionGames: ${response.data}');
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
    try {
      final response = await apiService.getEmotionsApi();
      if (response is ResSuccess) {
        Logger.i('getEmotions: ${response.data.length}');
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
