import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/core/network/api/dio_exception.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:getoutofthebox/core/network/api/token_storage.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options.baseUrl = 'http://srv674948.hstgr.cloud:80/api/v1/';
    dio.options.connectTimeout = const Duration(milliseconds: 5000);
    dio.options.receiveTimeout = const Duration(milliseconds: 3000);
  }

  Options getOptions() {
    return Options(
      headers: {
        'Content-type': 'application/json',
        'User-Agent': 'api-mobile-rent',
        ...Get.find<TokenStorage>().acsessToken.isNotEmpty
            ? {
                'Authorization':
                    'Bearer ${Get.find<TokenStorage>().acsessToken}'
              }
            : {},
      },
    );
  }

  Future<ResponseApi> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isExtended = true,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: getOptions(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return processResponse(response.data, url, isExtended: isExtended);
    } catch (e) {
      return errorHandling(e);
    }
  }

  Future<ResponseApi> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: getOptions(),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return processResponse(response.data, url);
    } catch (e) {
      return errorHandling(e);
    }
  }

  Future<ResponseApi> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: getOptions(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return processResponse(response.data, url);
    } catch (e) {
      return errorHandling(e);
    }
  }

  Future<ResponseApi> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: getOptions(),
        cancelToken: cancelToken,
      );
      return processResponse(response.data, url);
    } catch (e) {
      return errorHandling(e);
    }
  }
}

ResponseApi errorHandling(Object e) {
  if (e is DioException) {
    DioExceptions dioException = DioExceptions.fromDioError(e);
    return ResError(errorMessage: dioException.errorText);
  } else {
    return ResError(errorMessage: 'Unexpected error occurred: ${e.toString()}');
  }
}

ResponseApi processResponse(
  dynamic res,
  String path, {
  bool isExtended = true,
}) {
  if (isExtended || res['success'] == true) {
    late ResSuccess resSuccess;
    if (isExtended) {
      resSuccess = ResSuccess(res);
    } else {
      resSuccess = ResSuccess(res['base']);
    }
    resSuccess.consoleRes(path);
    return resSuccess;
  } else {
    if (res['error'] != null) {
      if (res['error']['error'] == null) {
        return ResError(errorMessage: res['error']);
      } else {
        final firstError = res['error']['error'].values.first[0];
        return ResError(errorMessage: firstError);
      }
    }
    return ResError(errorMessage: 'Ошибка сервера');
  }
}
