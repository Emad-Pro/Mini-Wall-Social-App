import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/profile/data/customProfileModel/profileModel.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<GetUsersEvent>(_getUsersMethod);
  }

  FutureOr<void> _getUsersMethod(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    try {
      final query = await FirebaseFirestore.instance.collection('users').get();
      final users = query.docs
          .map((doc) => CustomProfileModel.fromJson(doc.data()))
          .toList();
      emit(state.copyWith(
        getUsersState: RequestState.success,
        getUsersData: users,
      ));
    } catch (e) {
      emit(state.copyWith(
          getUsersState: RequestState.erorr, erorrMessage: e.toString()));
    }
  }
}
