import 'package:equatable/equatable.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/home/data/model/postsModel.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.postsModel,
      this.requestState = RequestState.normal,
      this.signOutState = RequestState.normal,
      this.postsRequestState = RequestHomeState.loading});
  final RequestState signOutState;
  final List<Posts>? postsModel;
  final RequestState requestState;
  final RequestHomeState postsRequestState;

  HomeState copyWith(
      {RequestState? signOutState,
      List<Posts>? postsModel,
      RequestState? requestState,
      RequestHomeState? postsRequestState}) {
    return HomeState(
        signOutState: signOutState ?? this.signOutState,
        postsModel: postsModel ?? this.postsModel,
        requestState: requestState ?? this.requestState,
        postsRequestState: postsRequestState ?? this.postsRequestState);
  }

  @override
  List<Object?> get props =>
      [signOutState, postsModel, requestState, postsRequestState];
}
