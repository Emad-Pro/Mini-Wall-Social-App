part of 'users_bloc.dart';

class UsersState extends Equatable {
  final RequestState getUsersState;
  final List<CustomProfileModel>? getUsersData;
  final String erorrMessage;

  const UsersState(
      {this.getUsersState = RequestState.loading,
      this.getUsersData,
      this.erorrMessage = ""});

  UsersState copyWith(
      {RequestState? getUsersState,
      List<CustomProfileModel>? getUsersData,
      String? erorrMessage}) {
    return UsersState(
        getUsersData: getUsersData ?? this.getUsersData,
        getUsersState: getUsersState ?? this.getUsersState,
        erorrMessage: erorrMessage ?? this.erorrMessage);
  }

  @override
  List<Object> get props => [];
}
