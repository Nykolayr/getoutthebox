part of 'emotion_bloc.dart';

sealed class EmotionEvent {}

/// Получение списка эмоций
class GetEmotions extends EmotionEvent {}

/// Получение списка игр по эмоции
class GetEmotionGames extends EmotionEvent {}

/// Изменение выбранной эмоции
class ChangeSelectedEmotion extends EmotionEvent {
  final EmotionModel emotion;
  ChangeSelectedEmotion({required this.emotion});
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
  final int id;
  RemoveInnerWork({required this.id});
}

/// Получение списка триггеров
class GetTrigers extends EmotionEvent {}

/// Выбор тригера
class ChangeSelectedTriger extends EmotionEvent {
  final TrigersModel triger;
  ChangeSelectedTriger({required this.triger});
}

/// Добавление нового посещения
class NewInnerWork extends EmotionEvent {}

/// Добавление звезды
class AddStars extends EmotionEvent {
  final int stars;
  AddStars({required this.stars});
}

/// Изменение выбранного посещения
class ChangeSelectedInnerWork extends EmotionEvent {
  final InWorkModel innerWork;
  ChangeSelectedInnerWork({required this.innerWork});
}

/// Изменение индекса тригера
class ChangeIndexTrigers extends EmotionEvent {
  final int index;
  ChangeIndexTrigers({required this.index});
}

/// Изменение индекса трансформа
class ChangeIndexTransform extends EmotionEvent {
  final int index;
  ChangeIndexTransform({required this.index});
}

/// Изменение индекса cognitive
class ChangeIndexCognitive extends EmotionEvent {
  final int index;
  ChangeIndexCognitive({required this.index});
}
