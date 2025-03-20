part of 'therapeutic_game_bloc.dart';

class TherapeuticGameState extends Equatable {
  final List<TherapeuticGame> therapeuticGames;
  final bool isLoading;
  final String errorMessage;
  final bool isListChange;
  final TherapeuticGame therapeuticGame;

  const TherapeuticGameState({
    required this.therapeuticGames,
    required this.isLoading,
    required this.errorMessage,
    required this.isListChange,
    required this.therapeuticGame,
  });

  factory TherapeuticGameState.initial() {
    return TherapeuticGameState(
      therapeuticGames: Get.find<TherapeuticGamesRepository>().therapeuticGames,
      isLoading: false,
      errorMessage: '',
      isListChange: false,
      therapeuticGame: TherapeuticGame.initial(),
    );
  }

  TherapeuticGameState copyWith({
    List<TherapeuticGame>? therapeuticGames,
    bool? isLoading,
    String? errorMessage,
    bool? isListChange,
    TherapeuticGame? therapeuticGame,
  }) {
    final shouldToggleList =
        isListChange != null && isListChange != this.isListChange ||
            therapeuticGame != null && therapeuticGame != this.therapeuticGame;

    return TherapeuticGameState(
      therapeuticGames: therapeuticGames ?? this.therapeuticGames,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isListChange: shouldToggleList ? !this.isListChange : this.isListChange,
      therapeuticGame: therapeuticGame ?? this.therapeuticGame,
    );
  }

  @override
  List<Object?> get props => [
        therapeuticGames,
        isLoading,
        errorMessage,
        therapeuticGame,
      ];
}
