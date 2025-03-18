import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/core/network/api/dio_client.dart';

class Api {
  final DioClient dio = Get.find<DioClient>();

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

  Future<ResponseApi> getGames() async {
    return await dio.get('/therapy_game');
  }
}
