part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({this.signOutState = RequestState.normal});
  final RequestState signOutState;
  HomeState copyWith({RequestState? signOutState}) {
    return HomeState(signOutState: signOutState ?? this.signOutState);
  }

  @override
  List<Object> get props => [signOutState];
}
