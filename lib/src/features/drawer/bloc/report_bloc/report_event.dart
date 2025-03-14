part of 'report_bloc.dart';

sealed class ReportEvent {}

class ReportCreateEvent extends ReportEvent {
  final String reason;
  final String description;

  ReportCreateEvent({required this.reason, required this.description});
}