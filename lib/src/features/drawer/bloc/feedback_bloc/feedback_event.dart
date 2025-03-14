part of 'feedback_bloc.dart';


sealed class FeedbackEvent {}

class FeedbackCreateEvent extends FeedbackEvent {
  final int rating;
  final String comment;

  FeedbackCreateEvent({required this.rating, required this.comment});
}