import 'package:bloc/bloc.dart';
import 'package:getoutofthebox/core/di/di.dart';
import 'package:getoutofthebox/core/network/api_service.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/therapeutic_games_repository.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';
import 'package:meta/meta.dart';

part 'therapeutic_game_event.dart';
part 'therapeutic_game_state.dart';

class TherapeuticGameBloc
    extends Bloc<TherapeuticGameEvent, TherapeuticGameState> {
  final repository =
      TherapeuticGamesRepository(apiService: getIt.get<ApiService>());

  TherapeuticGameBloc() : super(TherapeuticGameInitial()) {
    on<GetTherapeuticGame>((event, emit) async {
      emit(TherapeuticGameLoading());

      try {
        final response = await repository.getGames();

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Directly use response.data as a TherapeuticGamesList
          emit(TherapeuticGameSuccess(
              gamesList: TherapeuticGamesList.fromJson(response.data)));
        } else {
          emit(TherapeuticGameError(errorMessage: 'Something went wrong'));
        }
      } catch (e) {
        emit(TherapeuticGameError(errorMessage: 'Error: $e'));
      }
    });
  }
}
