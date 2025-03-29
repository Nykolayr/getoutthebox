part of 'emotion_bloc.dart';

class EmotionState extends Equatable {
  final List<EmotionGamesModel> emotionGames;
  final bool isLoading;
  final String errorMessage;
  final bool isListChange;
  final List<ExperienceModel> experience;
  final bool isChange;
  final List<InWorkModel> innerWorks;
  final InWorkModel selectedInnerWork;
  final int indexTrigers;
  final int indexTransform;
  final int indexCognitive;
  final int countEmotions;
  final int countInnerWorksCompleted;
  @override
  const EmotionState({
    required this.emotionGames,
    required this.isLoading,
    required this.errorMessage,
    required this.isListChange,
    required this.experience,
    required this.isChange,
    required this.innerWorks,
    required this.selectedInnerWork,
    required this.indexTrigers,
    required this.indexTransform,
    required this.indexCognitive,
    required this.countEmotions,
    required this.countInnerWorksCompleted,
  });

  factory EmotionState.initial() {
    return EmotionState(
      isLoading: false,
      errorMessage: '',
      isListChange: false,
      emotionGames: Get.find<EmotionRepository>().emotionGames,
      isChange: false,
      innerWorks: Get.find<EmotionRepository>().inWorks,
      selectedInnerWork: InWorkModel.init(0),
      experience: ExperienceModel.getExperiences(),
      indexTrigers: 0,
      indexTransform: 0,
      indexCognitive: 0,
      countEmotions: 0,
      countInnerWorksCompleted: Get.find<EmotionRepository>()
          .inWorks
          .where((e) => e.type == InnerWorkType.completed)
          .length,
    );
  }

  EmotionState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isListChange,
    List<EmotionGamesModel>? emotionGames,
    bool? isChange,
    List<InWorkModel>? innerWorks,
    InWorkModel? selectedInnerWork,
    List<ExperienceModel>? experience,
    int? indexTrigers,
    int? indexTransform,
    int? indexCognitive,
    int? countEmotions,
    int? countInnerWorksCompleted,
  }) {
    final shouldToggleList =
        isListChange != null && isListChange != this.isListChange ||
            emotionGames != null && emotionGames != this.emotionGames ||
            innerWorks != null && innerWorks != this.innerWorks ||
            experience != null && experience != this.experience ||
            selectedInnerWork != null &&
                selectedInnerWork != this.selectedInnerWork;

    return EmotionState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isListChange: shouldToggleList ? !this.isListChange : this.isListChange,
      emotionGames: emotionGames ?? this.emotionGames,
      experience: experience ?? this.experience,
      isChange: isChange ?? this.isChange,
      innerWorks: innerWorks ?? this.innerWorks,
      selectedInnerWork: selectedInnerWork ?? this.selectedInnerWork,
      indexTrigers: indexTrigers ?? this.indexTrigers,
      indexTransform: indexTransform ?? this.indexTransform,
      indexCognitive: indexCognitive ?? this.indexCognitive,
      countEmotions: countEmotions ?? this.countEmotions,
      countInnerWorksCompleted:
          countInnerWorksCompleted ?? this.countInnerWorksCompleted,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        errorMessage,
        isListChange,
        emotionGames,
        experience,
        isChange,
        innerWorks,
        selectedInnerWork,
        indexTrigers,
        indexTransform,
        indexCognitive,
        countEmotions,
        countInnerWorksCompleted,
      ];
}
