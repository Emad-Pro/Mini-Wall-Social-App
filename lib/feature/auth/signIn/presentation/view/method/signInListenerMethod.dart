import 'package:flutter/material.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/auth/signIn/presentation/viewModel/bloc/sign_in_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

void signInListenerMethod(SignInState state, BuildContext context) {
  if (state.signInRequestState == RequestState.success) {
    MotionToast.success(
      title: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text("Successfully Login"),
    ).show(context);
    Navigator.pushNamed(context, "/homeScreen");
  } else if (state.signInRequestState == RequestState.erorr) {
    MotionToast.error(
      title: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(state.signInMessage),
    ).show(context);
  }
}
