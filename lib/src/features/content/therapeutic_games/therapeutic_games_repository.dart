import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';

/// Репозиторий для списка терапевтических игр
class TherapeuticGamesRepository {
  static TherapeuticGamesRepository? _instance;
  late final Api apiService;
  List<TherapeuticGame> therapeuticGames = [];

  // Приватный конструктор
  TherapeuticGamesRepository._() {
    apiService = Get.find<Api>();
  }

  // Фабричный метод для получения экземпляра
  factory TherapeuticGamesRepository() {
    _instance ??= TherapeuticGamesRepository._();
    return _instance!;
  }

  // Метод для получения существующего экземпляра
  static TherapeuticGamesRepository get instance {
    _instance ??= TherapeuticGamesRepository._();
    return _instance!;
  }

  /// Получение списка терапевтических игр
  Future<String> getGames() async {
    try {
      final response = await apiService.getGames();
      if (response is ResSuccess) {
        Logger.i('response: ${response.data.length}');
        therapeuticGames = (response.data as List)
            .map((game) => TherapeuticGame.fromJson(game))
            .toList()
            .cast<TherapeuticGame>();
        return '';
      } else if (response is ResError) {
        return response.errorMessage;
      }
    } catch (e) {
      Logger.e('Ошибка при получении списка терапевтических игр: $e');
      return 'Ошибка при получении списка терапевтических игр $e';
    }
    return '';
  }
}
