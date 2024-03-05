part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final RequestState signUpCreateNewAccountState;
  final String signUpCreateNewAccountMeassge;
  const SignUpState(
      {this.signUpCreateNewAccountState = RequestState.normal,
      this.signUpCreateNewAccountMeassge = ''});

  SignUpState copyWith(
      {RequestState? signUpCreateNewAccountState,
      String? signUpCreateNewAccountMeassge}) {
    return SignUpState(
      signUpCreateNewAccountState:
          signUpCreateNewAccountState ?? this.signUpCreateNewAccountState,
      signUpCreateNewAccountMeassge:
          signUpCreateNewAccountMeassge ?? this.signUpCreateNewAccountMeassge,
    );
  }

  @override
  List<Object> get props =>
      [signUpCreateNewAccountMeassge, signUpCreateNewAccountState];
}
