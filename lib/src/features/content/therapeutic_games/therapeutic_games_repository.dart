import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';

class TherapeuticGamesRepository {
  final ApiService apiService;

  TherapeuticGamesRepository({required this.apiService});

  Future<TherapeuticGamesResponseModel> getGames() async {
    final response = await apiService.getData('/therapy_game');
    return TherapeuticGamesResponseModel.fromJson(
        response['data'], response['statusCode']);
  }
}
