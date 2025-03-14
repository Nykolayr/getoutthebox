import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/src/models/feedback_response_model.dart';

class FeedbackRepositoryImpl {
  final ApiService apiService;
  FeedbackRepositoryImpl({required this.apiService});
  Future<FeedbackResponceModel> feedback(
      {required int rating, required String comment}) async {
    final response = await apiService.postData('/feedback', {
      "rating": rating,
      "comment": comment,
    });
    return FeedbackResponceModel.fromJson(
        response['data'], response['statusCode']);
  }
}
