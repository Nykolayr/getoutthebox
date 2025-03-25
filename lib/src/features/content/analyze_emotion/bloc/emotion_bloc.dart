import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_repositories.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/in_work_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';

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
    on<GetTrigers>(_onGetTrigers);
    on<ChangeSelectedTriger>(_onChangeSelectedTriger);
    on<NewInnerWork>(_onNewInnerWork);
    on<AddStars>(_onAddStars);
    on<ChangeSelectedInnerWork>(_onChangeSelectedInnerWork);
  }

  /// Изменение выбранного посещения
  Future<void> _onChangeSelectedInnerWork(
      ChangeSelectedInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedInnerWork(event.innerWork);
    emit(state.copyWith(selectedInnerWork: event.innerWork));
  }

  /// Добавление звезды
  Future<void> _onAddStars(AddStars event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().addStars(event.stars);

    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork));
  }

  /// Добавление нового посещения
  Future<void> _onNewInnerWork(
      NewInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().addInWork();
    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().inWorks.last));
  }

  /// Изменение выбранного тригера
  Future<void> _onChangeSelectedTriger(
      ChangeSelectedTriger event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedTriger(event.triger);
    emit(state.copyWith(
        selectedTriger: event.triger,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Получение списка триггеров
  Future<void> _onGetTrigers(
      GetTrigers event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(isLoading: true));
    final answer = await Get.find<EmotionRepository>().getTrigers();
    emit(state.copyWith(isLoading: false));
    if (answer.isEmpty) {
      emit(state.copyWith(trigers: Get.find<EmotionRepository>().trigers));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }

  /// Добавление посещения в список
  Future<void> _onAddInnerWork(
      AddInnerWork event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(innerWorks: [...state.innerWorks]));
  }

  /// Удаление посещения из списка
  Future<void> _onRemoveInnerWork(
      RemoveInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().removeInWork(event.id);
    emit(state.copyWith(innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Изменение выбранного опыта
  Future<void> _onChangeSelectedExperience(
      ChangeSelectedExperience event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>()
        .changeSelectedExperience(state.experience[event.id]);
    emit(state.copyWith(
        selectedExperience: event.id,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork));
  }

  /// Изменение выбранной эмоции
  Future<void> _onChangeSelectedEmotion(
      ChangeSelectedEmotion event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedEmotion(event.emotion);
    Logger.i('selectedTriger: ${event.emotion.isSelected}');
    emit(state.copyWith(
        selectedTriger: Get.find<EmotionRepository>().selectedTriger,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks,
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
      emit(state.copyWith(
          selectedTriger: Get.find<EmotionRepository>().selectedTriger,
          selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
          innerWorks: Get.find<EmotionRepository>().inWorks));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }
}
