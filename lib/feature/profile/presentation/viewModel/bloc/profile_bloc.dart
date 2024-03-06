import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/profile/data/model/profileModel.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<GetUserDetailsProfileEvent>(_getUserDetails);
  }

  FutureOr<void> _getUserDetails(
      GetUserDetailsProfileEvent event, Emitter<ProfileState> emit) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      emit(state.copyWith(
          profileModel: CustomProfileModel.fromJson(value.data()!),
          requestState: RequestState.success));
    }).catchError((onError) {
      emit(state.copyWith(
          erorrMessage: onError.toString(), requestState: RequestState.erorr));
    });
  }
}
