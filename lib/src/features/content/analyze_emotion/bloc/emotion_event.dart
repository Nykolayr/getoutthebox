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
  final DateTime date;
  AddInnerWork({required this.date});
}

/// Удаление посещения из списка
class RemoveInnerWork extends EmotionEvent {
  final DateTime date;
  RemoveInnerWork({required this.date});
}
