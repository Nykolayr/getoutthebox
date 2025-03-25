import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/core/network/api/dio_client.dart';

class Api {
  final DioClient dio = Get.find<DioClient>();

  /// Получение списка триггеров
  Future<ResponseApi> getTrigersApi() async {
    return await dio.get('/trigger');
  }

  /// авторизация через google
  Future<ResponseApi> loginViaGoogle(String email, {String? fcmToken}) async {
    return await dio.post('/user/login_via_google', data: {
      'email': email,
      'fcm_token': fcmToken,
    });
  }

  /// авторизация через facebook
  Future<ResponseApi> loginViaFacebook(String email, {String? fcmToken}) async {
    return await dio.post('/user/login_via_facebook', data: {
      'email': email,
      'fcm_token': fcmToken,
    });
  }

  /// Получение списка терапевтических игр
  Future<ResponseApi> getGamesApi() async {
    return await dio.get('/therapy_game');
  }

  /// Получение терапевтической игры по id
  Future<ResponseApi> getGameByIdApi(String id) async {
    return await dio.get('/therapy_game/$id');
  }

  /// Получение списка вопросов терапевтической игры по id
  Future<ResponseApi> getQuestionsApi(String id) async {
    return await dio.get('/therapy_game/$id/get_questions_for_game');
  }

  /// Получение списка эмоций
  Future<ResponseApi> getEmotionsApi() async {
    return await dio.get('/emotion');
  }

  /// Получение списка игр по эмоции
  Future<ResponseApi> getEmotionGamesApi() async {
    return await dio.get('/emotion_game');
  }

  /// Получение списка триггеров
  Future<ResponseApi> getTriggersApi() async {
    return await dio.get('/trigger');
  }
}
