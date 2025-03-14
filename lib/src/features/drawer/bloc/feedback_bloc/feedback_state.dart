part of 'feedback_bloc.dart';

sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackInProccess extends FeedbackState {}

final class FeedbackSuccess extends FeedbackState {}

final class FeedbackError extends FeedbackState {
  final String? erorr;

  FeedbackError({required this.erorr});
}
