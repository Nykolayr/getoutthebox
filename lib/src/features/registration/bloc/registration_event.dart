part of 'registration_bloc.dart';

sealed class RegistrationEvent {}

class RegistrationCreateAccountEvent extends RegistrationEvent {
  final String email;
  final String password;

  RegistrationCreateAccountEvent({required this.email, required this.password});
}
