part of 'therapeutic_game_bloc.dart';

sealed class TherapeuticGameEvent {}

/// Получение списка терапевтических игр
class GetTherapeuticGame extends TherapeuticGameEvent {}

/// Получение терапевтической игры по id
class GetTherapeuticGameById extends TherapeuticGameEvent {
  final String id;
  GetTherapeuticGameById({required this.id});
}
