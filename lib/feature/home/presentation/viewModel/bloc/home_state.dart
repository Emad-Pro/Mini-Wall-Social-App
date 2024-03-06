part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.postsModel,
      this.requestState = RequestState.normal,
      this.signOutState = RequestState.normal});
  final RequestState signOutState;
  final PostsModel? postsModel;
  final RequestState requestState;

  HomeState copyWith({
    RequestState? signOutState,
    PostsModel? postsModel,
    RequestState? requestState,
  }) {
    return HomeState(
        signOutState: signOutState ?? this.signOutState,
        postsModel: postsModel ?? this.postsModel,
        requestState: requestState ?? this.requestState);
  }

  @override
  List<Object?> get props => [signOutState, postsModel, requestState];
}
