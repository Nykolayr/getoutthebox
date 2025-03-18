import 'package:get/get.dart';
import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/core/shared_prefs/shared_prefs_repo.dart';
import 'package:getoutofthebox/src/models/registration_reponse_model.dart';

import '../../../core/network/api/token_storage.dart';

abstract class RegistrationRepository {
  Future<RegistrationResponseModel> register(
      {required String email,
      required String password,
      required String passwordRepeat});
}

class RegistrationRepositoryImpl implements RegistrationRepository {
  final ApiService apiService;
  final prefs = getIt.get<SharedPrefsRepository>();
  RegistrationRepositoryImpl({required this.apiService});
  @override
  Future<RegistrationResponseModel> register(
      {required String email,
      required String password,
      required String passwordRepeat}) async {
    final response = await apiService.postData(
        '/user/register',
        {
          'email': email,
          'password': password,
          'password2': passwordRepeat,
        },
        useAuth: false);
    final responseModel = RegistrationResponseModel.fromJson(
        response['data'], response['statusCode']);
    if (responseModel.accessToken != null &&
        responseModel.refreshToken != null) {
      await prefs.setString('access_token', responseModel.accessToken!);
      await prefs.setString('refresh_token', responseModel.refreshToken!);
      await Get.find<TokenStorage>().saveTokens(
        responseModel.accessToken!,
        responseModel.refreshToken!,
      );
    }
    return responseModel;
  }
}
