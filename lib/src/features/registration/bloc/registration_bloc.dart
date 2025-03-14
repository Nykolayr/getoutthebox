import 'package:bloc/bloc.dart';
import 'package:getoutofthebox/src/features/registration/registration_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository registrationRepository;
  RegistrationBloc(this.registrationRepository)
      : super(RegistrationStateInitial()) {
    on<RegistrationCreateAccountEvent>((event, emit) async {
      emit(RegistarationStateInProccess());
      final response = await registrationRepository.register(
          email: event.email,
          password: event.password,
          passwordRepeat: event.password);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RegistarationStateSuccess());
      } else {
        emit(RegistarationStatenError(errorMessage: response.error));
      }
    });
  }
}
