part of 'emotion_bloc.dart';

sealed class EmotionEvent {}

/// Получение списка эмоций
class GetEmotions extends EmotionEvent {}

/// Получение списка игр по эмоции
class GetEmotionGames extends EmotionEvent {}

/// Изменение выбранной эмоции
class ChangeSelectedEmotion extends EmotionEvent {
  final int id;
  ChangeSelectedEmotion({required this.id});
}

/// Изменение выбранного опыта
class ChangeSelectedExperience extends EmotionEvent {
  final int id;
  ChangeSelectedExperience({required this.id});
}

/// Добавление посещения в список
class AddInnerWork extends EmotionEvent {
  final InWorkModel innerWork;
  AddInnerWork({required this.innerWork});
}

/// Удаление посещения из списка
class RemoveInnerWork extends EmotionEvent {
  final String id;
  RemoveInnerWork({required this.id});
}

/// Получение списка триггеров
class GetTrigers extends EmotionEvent {}
