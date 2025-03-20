import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_repositories.dart';

part 'emotion_event.dart';
part 'emotion_state.dart';

class EmotionBloc extends Bloc<EmotionEvent, EmotionState> {
  EmotionBloc() : super(EmotionState.initial()) {
    on<GetEmotions>(_onGetEmotions);
    on<GetEmotionGames>(_onGetEmotionGames);
    on<ChangeSelectedEmotion>(_onChangeSelectedEmotion);
    on<ChangeSelectedExperience>(_onChangeSelectedExperience);
    on<AddInnerWork>(_onAddInnerWork);
    on<RemoveInnerWork>(_onRemoveInnerWork);
  }

  /// Добавление посещения в список
  Future<void> _onAddInnerWork(
      AddInnerWork event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(innerWork: [...state.innerWork, event.date]));
  }

  /// Удаление посещения из списка
  Future<void> _onRemoveInnerWork(
      RemoveInnerWork event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(
        innerWork:
            state.innerWork.where((date) => date != event.date).toList()));
  }

  /// Изменение выбранного опыта
  Future<void> _onChangeSelectedExperience(
      ChangeSelectedExperience event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(selectedExperience: event.id));
  }

  /// Изменение выбранной эмоции
  Future<void> _onChangeSelectedEmotion(
      ChangeSelectedEmotion event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedEmotion(event.id);

    emit(state.copyWith(
        emotions: Get.find<EmotionRepository>().emotions,
        isListChange: !state.isListChange));
  }

  /// Получение списка игр по эмоции
  Future<void> _onGetEmotionGames(
      GetEmotionGames event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(isLoading: true));
    final answer = await Get.find<EmotionRepository>().getEmotionGames();
    emit(state.copyWith(isLoading: false));
    if (answer.isEmpty) {
      emit(state.copyWith(
          emotionGames: Get.find<EmotionRepository>().emotionGames));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }

  /// Получение списка эмоций
  Future<void> _onGetEmotions(
      GetEmotions event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(isLoading: true));
    final answer = await Get.find<EmotionRepository>().getEmotions();
    emit(state.copyWith(isLoading: false));
    if (answer.isEmpty) {
      emit(state.copyWith(emotions: Get.find<EmotionRepository>().emotions));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }
}
