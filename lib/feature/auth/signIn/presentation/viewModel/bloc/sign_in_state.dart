part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final RequestState signInRequestState;
  final String signInMessage;

  SignInState(
      {this.signInRequestState = RequestState.normal, this.signInMessage = ''});

  SignInState copyWith(
      {RequestState? signInRequestState, String? signInMessage}) {
    return SignInState(
      signInRequestState: signInRequestState ?? this.signInRequestState,
      signInMessage: signInMessage ?? this.signInMessage,
    );
  }

  @override
  List<Object?> get props => [
        signInRequestState,
        signInMessage,
      ];
}
