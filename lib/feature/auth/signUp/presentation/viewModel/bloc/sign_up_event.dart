part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignupCreateNewAccountEvent extends SignUpEvent {
  final String userName;
  final String email;
  final String password;

  const SignupCreateNewAccountEvent(this.userName, this.email, this.password);
}
