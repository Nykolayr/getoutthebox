import 'package:dio/dio.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/dio_client.dart';
import 'package:getoutofthebox/core/network/api/token_storage.dart';

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
}
