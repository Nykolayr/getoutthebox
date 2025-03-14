part of 'report_bloc.dart';

sealed class ReportState {}

final class ReportBlocInitial extends ReportState {}

final class ReportInProccess extends ReportState {}

final class ReportSuccess extends ReportState {}

final class ReportFailure extends ReportState {
  final String error;
  ReportFailure({required this.error});
} 