part of 'emotion_bloc.dart';

class EmotionState extends Equatable {
  final List<EmotionGamesModel> emotionGames;
  final List<EmotionModel> emotions;
  final bool isLoading;
  final String errorMessage;
  final bool isListChange;
  final List<String> experience;
  final int selectedExperience;
  @override
  const EmotionState({
    required this.emotionGames,
    required this.emotions,
    required this.isLoading,
    required this.errorMessage,
    required this.isListChange,
    required this.experience,
    required this.selectedExperience,
  });

  factory EmotionState.initial() {
    return EmotionState(
      emotions: Get.find<EmotionRepository>().emotions,
      isLoading: false,
      errorMessage: '',
      isListChange: false,
      emotionGames: Get.find<EmotionRepository>().emotionGames,
      experience: Get.find<EmotionRepository>().experience,
      selectedExperience: 0,
    );
  }

  EmotionState copyWith({
    List<EmotionModel>? emotions,
    bool? isLoading,
    String? errorMessage,
    bool? isListChange,
    EmotionModel? emotion,
    List<EmotionGamesModel>? emotionGames,
    List<String>? experience,
    int? selectedExperience,
  }) {
    final shouldToggleList =
        isListChange != null && isListChange != this.isListChange ||
            emotionGames != null && emotionGames != this.emotionGames ||
            emotions != null && emotions != this.emotions;

    return EmotionState(
      emotions: emotions ?? this.emotions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isListChange: shouldToggleList ? !this.isListChange : this.isListChange,
      emotionGames: emotionGames ?? this.emotionGames,
      experience: experience ?? this.experience,
      selectedExperience: selectedExperience ?? this.selectedExperience,
    );
  }

  @override
  List<Object> get props => [
        emotions,
        isLoading,
        errorMessage,
        isListChange,
        emotionGames,
        experience,
        selectedExperience,
      ];
}
