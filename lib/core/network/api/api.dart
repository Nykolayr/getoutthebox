import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/core/network/api/dio_client.dart';

class Api {
  final DioClient dio = Get.find<DioClient>();

  /// получить html политики
  Future<ResponseApi> getPrivacyPolicy(String lang) async {
    return await dio.get('/api/mobile/page/$lang/privacy_policy');
  }
}
