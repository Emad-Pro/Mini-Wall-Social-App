import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_app/core/enum/enum.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<NewSignInEvent>(_newLoginSignInMethod);
  }

  FutureOr<void> _newLoginSignInMethod(
      NewSignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(signInRequestState: RequestState.loading));
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(state.copyWith(
          signInRequestState: RequestState.success, signInMessage: "Hello "));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signInRequestState: RequestState.erorr, signInMessage: e.message));
    }
  }
}
