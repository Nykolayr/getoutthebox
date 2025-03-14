import 'package:bloc/bloc.dart';
import 'package:getoutofthebox/src/features/drawer/feedback_repository.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepositoryImpl feedbackRepositoryImpl;

  FeedbackBloc(this.feedbackRepositoryImpl) : super(FeedbackInitial()) {
    on<FeedbackCreateEvent>((event, emit) async {
      emit(FeedbackInProccess());
      final response = await feedbackRepositoryImpl.feedback(
        rating: event.rating,
        comment: event.comment,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(FeedbackSuccess());
      } else {
        emit(FeedbackError(erorr: response.error));
      }
    });
  }
}
