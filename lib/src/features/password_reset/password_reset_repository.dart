import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/core/shared_prefs/shared_prefs_repo.dart';
import 'package:getoutofthebox/src/models/password_reset_model.dart';

class ResetPasswordRepositoryImpl {
  final ApiService apiService;
  final prefs = getIt.get<SharedPrefsRepository>();
  ResetPasswordRepositoryImpl({required this.apiService});

  Future<PasswordResetModel> sendConfirmationCode({
    required String email,
  }) async {
    final response = await apiService.postData(
        '/user/send_confirmation_code',
        {
          'email': email,
        },
        useAuth: false);
    final responseModel =
        PasswordResetModel.fromJson(response['data'], response['statusCode']);
    return responseModel;
  }

  Future<PasswordResetModel> confirmCode({
    required String email,
    required String code,
  }) async {
    final response = await apiService.postData(
        '/user/verify_confirmation_code',
        {
          'email': email,
          'code': code,
        },
        useAuth: false);
    final responseModel =
        PasswordResetModel.fromJson(response['data'], response['statusCode']);
    return responseModel;
  }

  Future<PasswordResetModel> setNewPassword({
    required String email,
    required String newPassword,
    required String confrimPassword,
  }) async {
    final response = await apiService.postData(
        '/user/reset_password',
        {
          'email': email,
          'new_password': newPassword,
          'confirm_password': confrimPassword
        },
        useAuth: false);
    final responseModel =
        PasswordResetModel.fromJson(response['data'], response['statusCode']);
    return responseModel;
  }
}
