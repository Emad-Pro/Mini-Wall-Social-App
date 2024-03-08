import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/home/data/model/postsModel.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  StreamSubscription? streamSubscription;
  FutureOr<void> signOutAccount() async {
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

  void listenToGetPosts() async {
    emit(state.copyWith(postsRequestState: RequestHomeState.loading));
    final usersStream = FirebaseFirestore.instance
        .collection("posts")
        .orderBy("timeStamp", descending: true)
        .snapshots();
    usersStream.listen((snapshot) async {
      try {
        final users =
            snapshot.docs.map((doc) => Posts.fromSnapshot(doc)).toList();
        emit(state.copyWith(
            postsRequestState: RequestHomeState.success, postsModel: users));
      } catch (error) {
        emit(state.copyWith(postsRequestState: RequestHomeState.erorr));
      }
    });
  }

  FutureOr<void> addPostsHomeMethod(String message) async {
    final User? firebaseAuth = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("posts")
        .add({
          "userName": firebaseAuth!.displayName,
          "userEmail": firebaseAuth.email,
          "postMessage": message,
          "timeStamp": Timestamp.now()
        })
        .then((value) {})
        .catchError((onError) {});
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
