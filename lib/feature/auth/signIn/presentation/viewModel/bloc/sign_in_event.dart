part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class NewSignInEvent extends SignInEvent {
  final String email;
  final String password;

  const NewSignInEvent(this.email, this.password);
}
