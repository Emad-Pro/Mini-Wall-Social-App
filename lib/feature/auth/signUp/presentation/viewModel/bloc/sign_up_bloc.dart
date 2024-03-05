import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_app/core/enum/enum.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignupCreateNewAccountEvent>(_createNewAccount);
  }

  FutureOr<void> _createNewAccount(
      SignupCreateNewAccountEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(signUpCreateNewAccountState: RequestState.loading));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          "userName": event.userName,
        });
      }
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.success,
          signUpCreateNewAccountMeassge: "Sign Up is Success"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.erorr,
          signUpCreateNewAccountMeassge: e.message));
    }
  }
}
