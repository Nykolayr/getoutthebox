import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/core/network/api/token_storage.dart';
import 'package:getoutofthebox/core/network/dio_client.dart';
import 'package:getoutofthebox/core/shared_prefs/shared_prefs_repo.dart';
import 'package:talker/talker.dart';

class ApiService {
  final DioClient dioClient;
  final Talker talker = Talker();

  ApiService(this.dioClient);

  getAuthTokens() async {
    String? accessToken = await Get.find<TokenStorage>().getAcsessToken();
    String? refreshToken = await Get.find<TokenStorage>().getRefreshToken();
    return {
      'refresh_token': refreshToken,
      'access_token': accessToken,
    };
  }

  Future<Map<String, dynamic>> getData(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final tokens = await getAuthTokens();
      final accessToken = tokens['access_token'];

      final defaultHeaders = {
        'Authorization': 'Bearer $accessToken',
      };
      final mergedHeaders = {...?headers, ...defaultHeaders};

      final response = await dioClient.client.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: mergedHeaders),
      );

      return {
        'data': response.data,
        'statusCode': response.statusCode,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      talker.error('DioError при выполнении GET-запроса: $e');
      return {
        'data': e.response?.data,
        'statusCode': e.response?.statusCode ?? 500,
        'statusMessage': e.response?.statusMessage ?? 'Unknown Error',
      };
    }
  }

  Future<Map<String, dynamic>> postData(
    String path,
    dynamic data, {
    bool useAuth = true,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Map<String, dynamic>? mergedHeaders;

      // Если нужен токен, добавляем его в заголовки
      if (useAuth) {
        final tokens = await getAuthTokens();
        final accessToken = tokens['access_token'];

        final defaultHeaders = {
          'Authorization': 'Bearer $accessToken',
        };
        mergedHeaders = {...?headers, ...defaultHeaders};
      } else {
        mergedHeaders = headers;
      }

      final response = await dioClient.client.post(
        path,
        data: data,
        options: Options(headers: mergedHeaders),
      );

      return {
        'data': response.data,
        'statusCode': response.statusCode,
        'statusMessage': response.statusMessage,
      };
    } on DioException catch (e) {
      talker.error('DioError при выполнении POST-запроса: $e');
      return {
        'data': e.response?.data,
        'statusCode': e.response?.statusCode ?? 500,
        'statusMessage': e.response?.statusMessage ?? 'Unknown Error',
      };
    }
  }

  Future<void> refreshTokens() async {
    final prefs = getIt.get<SharedPrefsRepository>();
    final refreshToken = await prefs.getString('refresh_token');

    try {
      final response = await dioClient.client.post(
        '/token/refresh',
        data: {'refresh': refreshToken},
      );
      final newAccessToken = response.data['access'];
      final newRefreshToken = response.data['refresh'];
      await prefs.setString('access_token', newAccessToken);
      await prefs.setString('refresh_token', newRefreshToken);
      await Get.find<TokenStorage>().saveTokens(
        newAccessToken,
        newRefreshToken,
      );
    } catch (e) {
      talker.error('Ошибка при обновлении токенов: $e');
      rethrow;
    }
  }
}
