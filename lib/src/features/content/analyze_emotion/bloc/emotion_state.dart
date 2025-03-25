part of 'emotion_bloc.dart';

class EmotionState extends Equatable {
  final List<EmotionGamesModel> emotionGames;
  final bool isLoading;
  final String errorMessage;
  final bool isListChange;
  final List<String> experience;
  final int selectedExperience;
  final bool isChange;
  final List<InWorkModel> innerWorks;
  final List<TrigersModel> trigers;
  final TrigersModel selectedTriger;
  final InWorkModel selectedInnerWork;

  @override
  const EmotionState({
    required this.emotionGames,
    required this.isLoading,
    required this.errorMessage,
    required this.isListChange,
    required this.experience,
    required this.selectedExperience,
    required this.isChange,
    required this.innerWorks,
    required this.trigers,
    required this.selectedTriger,
    required this.selectedInnerWork,
  });

  factory EmotionState.initial() {
    return EmotionState(
      isLoading: false,
      errorMessage: '',
      isListChange: false,
      emotionGames: Get.find<EmotionRepository>().emotionGames,
      experience: Get.find<EmotionRepository>().experience,
      selectedExperience: 0,
      isChange: false,
      innerWorks: Get.find<EmotionRepository>().inWorks,
      trigers: Get.find<EmotionRepository>().trigers,
      selectedTriger: TrigersModel.init(),
      selectedInnerWork: InWorkModel.init(0),
    );
  }

  EmotionState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isListChange,
    List<EmotionGamesModel>? emotionGames,
    List<String>? experience,
    int? selectedExperience,
    bool? isChange,
    List<InWorkModel>? innerWorks,
    List<TrigersModel>? trigers,
    TrigersModel? selectedTriger,
    InWorkModel? selectedInnerWork,
  }) {
    final shouldToggleList =
        isListChange != null && isListChange != this.isListChange ||
            emotionGames != null && emotionGames != this.emotionGames ||
            innerWorks != null && innerWorks != this.innerWorks ||
            trigers != null && trigers != this.trigers ||
            selectedTriger != null && selectedTriger != this.selectedTriger ||
            selectedInnerWork != null &&
                selectedInnerWork != this.selectedInnerWork;

    return EmotionState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isListChange: shouldToggleList ? !this.isListChange : this.isListChange,
      emotionGames: emotionGames ?? this.emotionGames,
      experience: experience ?? this.experience,
      selectedExperience: selectedExperience ?? this.selectedExperience,
      isChange: isChange ?? this.isChange,
      innerWorks: innerWorks ?? this.innerWorks,
      trigers: trigers ?? this.trigers,
      selectedTriger: selectedTriger ?? this.selectedTriger,
      selectedInnerWork: selectedInnerWork ?? this.selectedInnerWork,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        errorMessage,
        isListChange,
        emotionGames,
        experience,
        selectedExperience,
        isChange,
        innerWorks,
        trigers,
        selectedTriger,
        selectedInnerWork,
      ];
}
