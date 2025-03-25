import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/in_work_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

/// Репозиторий для списка терапевтических игр
class EmotionRepository {
  static EmotionRepository? _instance;
  late final Api apiService;
  List<EmotionModel> emotions = [];
  List<EmotionGamesModel> emotionGames = [];
  List<TrigersModel> trigers = [];
  EmotionModel emotion = EmotionModel.initial();
  List<InWorkModel> inWorks = [];
  InWorkModel selectedInnerWork = InWorkModel.init(0);
  TrigersModel selectedTriger = TrigersModel.initial();
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

  /// Изменение выбранного посещения
  void changeSelectedInnerWork(InWorkModel innerWork) {
    selectedInnerWork = innerWork;
  }

  /// Добавление звезды
  void addStars(int stars) {
    selectedInnerWork.stars = stars;
  }

  /// Изменение выбранного опыта
  void changeSelectedExperience(String experience) {
    selectedInnerWork.experience = experience;
  }

  /// добавление выбранного тригера
  void changeSelectedTriger(TrigersModel triger) {
    selectedTriger = triger;
    if (!selectedInnerWork.trigers.contains(triger)) {
      selectedInnerWork.trigers.add(triger);
    }
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
  void changeSelectedEmotion(EmotionModel emotion) {
    int index = selectedTriger.emotions
        .indexWhere((element) => element.id == emotion.id);
    selectedTriger.emotions[index] = emotion.copyWith(
        isSelected: !selectedTriger.emotions[index].isSelected);
  }

  /// Получение списка триггеров
  Future<String> getTrigers() async {
    trigers.clear();
    try {
      final response = await apiService.getTrigersApi();
      if (response is ResSuccess) {
        Logger.i('getTrigers: ${response.data}');
        trigers = (response.data as List)
            .map((game) => TrigersModel.fromJson(game))
            .toList()
            .cast<TrigersModel>();
        Logger.i('getTrigers length: ${trigers.length}');
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
    emotions.clear();
    try {
      final response = await apiService.getEmotionsApi();
      if (response is ResSuccess) {
        Logger.i('getEmotions: ${response.data.length}');
        // emotions = (response.data as List)
        //     .map((game) => EmotionModel.fromJson(game))
        //     .toList()
        //     .cast<EmotionModel>();
        emotions = EmotionModel.getEmotions();
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
