part of 'therapeutic_game_bloc.dart';

class TherapeuticGameState extends Equatable {
  final List<TherapeuticGame> therapeuticGames;
  final bool isLoading;
  final String errorMessage;
  final bool isListChange;

  const TherapeuticGameState({
    required this.therapeuticGames,
    required this.isLoading,
    required this.errorMessage,
    required this.isListChange,
  });

  factory TherapeuticGameState.initial() {
    return TherapeuticGameState(
      therapeuticGames: Get.find<TherapeuticGamesRepository>().therapeuticGames,
      isLoading: false,
      errorMessage: '',
      isListChange: false,
    );
  }

  TherapeuticGameState copyWith({
    List<TherapeuticGame>? therapeuticGames,
    bool? isLoading,
    String? errorMessage,
    bool? isListChange,
  }) {
    final shouldToggleList =
        isListChange != null && isListChange != this.isListChange;

    return TherapeuticGameState(
      therapeuticGames: therapeuticGames ?? this.therapeuticGames,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isListChange: shouldToggleList ? !this.isListChange : this.isListChange,
    );
  }

  @override
  List<Object?> get props => [therapeuticGames, isLoading, errorMessage];
}
