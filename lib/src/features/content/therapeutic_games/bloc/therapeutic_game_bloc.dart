import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/therapeutic_games/therapeutic_games_repository.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';
part 'therapeutic_game_event.dart';
part 'therapeutic_game_state.dart';

class TherapeuticGameBloc
    extends Bloc<TherapeuticGameEvent, TherapeuticGameState> {
  final repository = Get.find<TherapeuticGamesRepository>();

  TherapeuticGameBloc() : super(TherapeuticGameState.initial()) {
    on<GetTherapeuticGame>(_onGetTherapeuticGame);
  }

  Future<void> _onGetTherapeuticGame(
      GetTherapeuticGame event, Emitter<TherapeuticGameState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final answer = await repository.getGames();
      emit(state.copyWith(isLoading: false));
      if (answer == '') {
        emit(state.copyWith(
            therapeuticGames:
                Get.find<TherapeuticGamesRepository>().therapeuticGames));
      } else {
        emit(state.copyWith(errorMessage: answer));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
