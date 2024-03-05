import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_social_app/core/enum/enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SignUpHomeEvent>(_signOutAccount);
  }

  FutureOr<void> _signOutAccount(
      SignUpHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(signOutState: RequestState.loading));
    try {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(signOutState: RequestState.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(signOutState: RequestState.erorr));
    }
  }
}
