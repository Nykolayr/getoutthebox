import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_games_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/emotion_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/emotion_repositories.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/experience_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/in_work_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/models/trigers_model.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/page/wrap_inner_work.dart';

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
    on<NewInnerWork>(_onNewInnerWork);
    on<AddStars>(_onAddStars);
    on<ChangeSelectedInnerWork>(_onChangeSelectedInnerWork);
    on<ChangeIndexTrigers>(_onChangeIndexTrigers);
    on<ChangeIndexTransform>(_onChangeIndexTransform);
    on<ChangeIndexCognitive>(_onChangeIndexCognitive);
    on<ChangeNote>(_onChangeNote);
    on<ChangeTypeInnerWork>(_onChangeTypeInnerWork);
  }

  /// Изменение типа посещения
  Future<void> _onChangeTypeInnerWork(
      ChangeTypeInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeTypeInnerWork(event.type, event.id);
    emit(state.copyWith(
      innerWorks: Get.find<EmotionRepository>().inWorks,
      selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
      isListChange: !state.isListChange,
      countInnerWorksCompleted: Get.find<EmotionRepository>()
          .inWorks
          .where((e) => e.type == InnerWorkType.completed)
          .length,
    ));
  }

  /// Изменение заметки
  Future<void> _onChangeNote(
      ChangeNote event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>()
        .changeNote(event.note, event.type, event.index);
    emit(state.copyWith(
      selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
      innerWorks: Get.find<EmotionRepository>().inWorks,
    ));
  }

  /// Изменение индекса тригера
  Future<void> _onChangeIndexTrigers(
      ChangeIndexTrigers event, Emitter<EmotionState> emit) async {
    final index = Get.find<EmotionRepository>().addTrigers(event.index);
    emit(
      state.copyWith(
          indexTrigers: index,
          selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
          innerWorks: Get.find<EmotionRepository>().inWorks),
    );
  }

  /// Изменение индекса трансформа
  Future<void> _onChangeIndexTransform(
      ChangeIndexTransform event, Emitter<EmotionState> emit) async {
    final index = Get.find<EmotionRepository>().addTransform(event.index);
    emit(state.copyWith(
        indexTransform: index,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Изменение индекса cognitive
  Future<void> _onChangeIndexCognitive(
      ChangeIndexCognitive event, Emitter<EmotionState> emit) async {
    final index = Get.find<EmotionRepository>().addCognitive(event.index);
    emit(state.copyWith(
        indexCognitive: index,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Изменение выбранного посещения
  Future<void> _onChangeSelectedInnerWork(
      ChangeSelectedInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedInnerWork(event.innerWork);
    emit(state.copyWith(
        selectedInnerWork: event.innerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Добавление звезды
  Future<void> _onAddStars(AddStars event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().addStars(event.stars, state.indexTransform);

    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Добавление нового посещения
  Future<void> _onNewInnerWork(
      NewInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().addInWork();
    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().inWorks.last,
        innerWorks: Get.find<EmotionRepository>().inWorks,
        countEmotions: 0));
  }

  /// Получение списка триггеров
  Future<void> _onGetTrigers(
      GetTrigers event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(isLoading: true));
    final answer = await Get.find<EmotionRepository>().getTrigers();
    emit(state.copyWith(isLoading: false));
    if (answer.isEmpty) {
      // emit(state.copyWith(trigers: Get.find<EmotionRepository>().trigers));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }

  /// Добавление посещения в список
  Future<void> _onAddInnerWork(
      AddInnerWork event, Emitter<EmotionState> emit) async {
    emit(state.copyWith(innerWorks: [...state.innerWorks], countEmotions: 0));
  }

  /// Удаление посещения из списка
  Future<void> _onRemoveInnerWork(
      RemoveInnerWork event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().removeInWork(event.id);
    emit(state.copyWith(
        innerWorks: Get.find<EmotionRepository>().inWorks,
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork));
  }

  /// Изменение выбранного опыта
  Future<void> _onChangeSelectedExperience(
      ChangeSelectedExperience event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>()
        .changeSelectedExperience(state.experience[event.id]);
    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks));
  }

  /// Изменение выбранной эмоции
  Future<void> _onChangeSelectedEmotion(
      ChangeSelectedEmotion event, Emitter<EmotionState> emit) async {
    Get.find<EmotionRepository>().changeSelectedEmotion(
        event.emotion, state.indexTrigers, state.countEmotions == 3);

    int countEmotions = Get.find<EmotionRepository>()
        .selectedInnerWork
        .trigers[state.indexTrigers]
        .emotions
        .where((element) => element.isSelected)
        .length;

    emit(state.copyWith(
        selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
        innerWorks: Get.find<EmotionRepository>().inWorks,
        countEmotions: countEmotions,
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
          selectedInnerWork: Get.find<EmotionRepository>().selectedInnerWork,
          innerWorks: Get.find<EmotionRepository>().inWorks));
    } else {
      emit(state.copyWith(errorMessage: answer));
    }
  }
}
