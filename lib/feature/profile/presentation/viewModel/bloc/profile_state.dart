part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final CustomProfileModel? profileModel;
  final RequestState requestState;
  final String erorrMessage;
  const ProfileState(
      {this.profileModel,
      this.requestState = RequestState.loading,
      this.erorrMessage = ""});
  ProfileState copyWith(
      {CustomProfileModel? profileModel,
      RequestState? requestState,
      String? erorrMessage}) {
    return ProfileState(
        profileModel: profileModel ?? this.profileModel,
        requestState: requestState ?? this.requestState,
        erorrMessage: erorrMessage ?? this.erorrMessage);
  }

  @override
  List<Object?> get props => [profileModel, requestState, erorrMessage];
}
