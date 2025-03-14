part of 'therapeutic_game_bloc.dart';

@immutable
sealed class TherapeuticGameState {}

final class TherapeuticGameInitial extends TherapeuticGameState {}

final class TherapeuticGameLoading extends TherapeuticGameState {}

final class TherapeuticGameSuccess extends TherapeuticGameState {
  final TherapeuticGamesList gamesList;

  TherapeuticGameSuccess({required this.gamesList});
}

final class TherapeuticGameError extends TherapeuticGameState {
  final String? errorMessage;
  TherapeuticGameError({required this.errorMessage});
}
