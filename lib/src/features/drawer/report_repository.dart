import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/src/models/report_response_model.dart';

class ReportRepositoryImpl {
  final ApiService apiService;
  ReportRepositoryImpl({required this.apiService});
  Future<ReportResponseModal> report({
    required String reason,
    required String description,
  }) async {
    final response = await apiService.postData(
      '/report',
      {
        "reason": reason,
        "description": description,
      },
      useAuth: true,
    );
    return ReportResponseModal.fromJson(
        response['data'], response['statusCode']);
  }
}
