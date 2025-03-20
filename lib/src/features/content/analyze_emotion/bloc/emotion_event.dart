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

class ChangeSelectedExperience extends EmotionEvent {
  final int id;
  ChangeSelectedExperience({required this.id});
}
