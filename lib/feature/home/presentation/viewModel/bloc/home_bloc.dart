import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/home/data/model/postsModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SignUpHomeEvent>(_signOutAccount);

    on<AddPostHomeEvent>(_addPostsHomeMethod);
  }

  FutureOr<void> _signOutAccount(
      SignUpHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(signOutState: RequestState.loading));
    try {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(signOutState: RequestState.success));
    } on FirebaseAuthException {
      emit(state.copyWith(
        signOutState: RequestState.erorr,
      ));
    }
  }

  Stream<QuerySnapshot> getPostsHomeMethod() {
    final postsStream = FirebaseFirestore.instance
        .collection("posts")
        .orderBy("timeStamp", descending: true)
        .snapshots();

    return postsStream;
  }

  FutureOr<void> _addPostsHomeMethod(
      AddPostHomeEvent event, Emitter<HomeState> emit) async {
    final User? firebaseAuth = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("posts")
        .add({
          "userName": firebaseAuth!.displayName,
          "userEmail": firebaseAuth.email,
          "postMessage": event.message,
          "timeStamp": Timestamp.now()
        })
        .then((value) {})
        .catchError((onError) {});
  }
}
