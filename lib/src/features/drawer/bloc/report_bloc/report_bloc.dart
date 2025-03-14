import 'package:bloc/bloc.dart';
import 'package:getoutofthebox/src/features/drawer/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepositoryImpl reportRepositoryImpl;

  ReportBloc(this.reportRepositoryImpl) : super(ReportBlocInitial()) {
    on<ReportCreateEvent>((event, emit) async {
      emit(ReportInProccess()); // Показываем состояние загрузки
      try {
        final response = await reportRepositoryImpl.report(
          reason: event.reason,
          description: event.description,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(ReportSuccess()); // Успешная отправка
        } else {
          emit(ReportFailure(error: 'Failed to send report')); // Ошибка сервера
        }
      } catch (e) {
        emit(ReportFailure(error: e.toString())); // Обработка исключений
      }
    });
  }
}
